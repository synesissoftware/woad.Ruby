# frozen_string_literal: true
# ######################################################################## #
# File:     woad.rb
#
# Purpose:  Primary require for woad.Ruby library
#
# Created:  15th August 2026
# Updated:  16th November 2026
#
# Home:     https://github.com/synesissoftware/woad.Ruby
#
# Author:   Matthew Wilson
#
# Copyright (c) 2026, Matthew Wilson and Synesis Information Systems
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# * Redistributions of source code must retain the above copyright
#   notice, this list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in the
#   documentation and/or other materials provided with the distribution.
#
# * Neither the names of the copyright holder nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
# IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# ######################################################################## #


=begin
=end

## Root module for *woad*
module Woad

  # Attributes (always emit; they do not consult the environment)

  BLINKING                = "\e[5m"
  BOLD                    = "\e[1m"
  RESET                   = "\e[0m"

  # Foreground (standard)

  FG_BLACK                = "\e[30m"
  FG_RED                  = "\e[31m"
  FG_GREEN                = "\e[32m"
  FG_YELLOW               = "\e[33m"
  FG_BLUE                 = "\e[34m"
  FG_MAGENTA              = "\e[35m"
  FG_CYAN                 = "\e[36m"
  FG_WHITE                = "\e[37m"

  # Foreground (bright)

  FG_BRIGHT_BLACK         = "\e[90m"
  FG_BRIGHT_RED           = "\e[91m"
  FG_BRIGHT_GREEN         = "\e[92m"
  FG_BRIGHT_YELLOW        = "\e[93m"
  FG_BRIGHT_BLUE          = "\e[94m"
  FG_BRIGHT_MAGENTA       = "\e[95m"
  FG_BRIGHT_CYAN          = "\e[96m"
  FG_BRIGHT_WHITE         = "\e[97m"

  # Background (standard)

  BG_BLACK                = "\e[40m"
  BG_RED                  = "\e[41m"
  BG_GREEN                = "\e[42m"
  BG_YELLOW               = "\e[43m"
  BG_BLUE                 = "\e[44m"
  BG_MAGENTA              = "\e[45m"
  BG_CYAN                 = "\e[46m"
  BG_WHITE                = "\e[47m"

  # Background (bright)

  BG_BRIGHT_BLACK         = "\e[100m"
  BG_BRIGHT_RED           = "\e[101m"
  BG_BRIGHT_GREEN         = "\e[102m"
  BG_BRIGHT_YELLOW        = "\e[103m"
  BG_BRIGHT_BLUE          = "\e[104m"
  BG_BRIGHT_MAGENTA       = "\e[105m"
  BG_BRIGHT_CYAN          = "\e[106m"
  BG_BRIGHT_WHITE         = "\e[107m"

  # Colour policy (cached until refresh)

  COLOUR_POLICY_AUTO      = 0
  COLOUR_POLICY_FORCE     = 1
  COLOUR_POLICY_INHIBIT   = 2

  # @!visibility private
  FALSEY_ = [ # :nodoc:
    '0',
    'false',
    'never',
    'no',
    'none',
    'off',
  ].freeze
  # @!visibility private
  TRUEY_ = [ # :nodoc:
    '1',
    'always',
    'force',
    'on',
    'true',
    'yes',
  ].freeze
  private_constant :FALSEY_
  private_constant :TRUEY_

  # Returns the cached colour policy: 0 auto, 1 force, 2 inhibit.
  def self.colour_policy

    ensure_environment_

    @policy
  end

  # Drops the cached policy and the cached TERM=dumb flag.
  def self.refresh

    @environment_determined = false

    nil
  end

  # True when colour should be emitted for this writer.
  def self.supports_colour(io)

    ensure_environment_

    case @policy
    when COLOUR_POLICY_FORCE

      return true
    when COLOUR_POLICY_INHIBIT

      return false
    end

    return false unless attached_(io)
    return false if @term_is_dumb

    true
  end

  # The sequence when the writer supports colour; otherwise "".
  def self.seq_for(io, seq)

    return '' if seq.nil?
    return '' unless supports_colour(io)

    seq
  end

  class << self

    private

    def attached_(io)

      return false if io.nil?
      return false unless io.respond_to?(:isatty)

      io.isatty ? true : false
    end

    def ensure_environment_

      return if @environment_determined

      @policy = policy_from_environment_
      @term_is_dumb = term_is_dumb_
      @environment_determined = true
    end

    def env_nonempty_(name)

      value = ENV[name]

      return nil if value.nil? || value.empty?

      value
    end

    def listed_?(value, tokens)

      tokens.any? { |token| value.casecmp(token) == 0 }
    end

    def policy_from_environment_

      value = env_nonempty_('WOAD_COLOUR')
      value = env_nonempty_('WOAD_COLOR') if value.nil?

      unless value.nil?

        return COLOUR_POLICY_FORCE if listed_?(value, TRUEY_)
        return COLOUR_POLICY_INHIBIT if listed_?(value, FALSEY_)

        return COLOUR_POLICY_AUTO
      end

      return COLOUR_POLICY_INHIBIT unless env_nonempty_('NO_COLOR').nil?

      value = env_nonempty_('CLICOLOR_FORCE')

      unless value.nil?

        return COLOUR_POLICY_FORCE if value != '0'
      end

      value = env_nonempty_('FORCE_COLOR')

      unless value.nil?

        if value != '0' && value.casecmp('false') != 0

          return COLOUR_POLICY_FORCE
        end
      end

      value = env_nonempty_('CLICOLOR')

      unless value.nil?

        return COLOUR_POLICY_INHIBIT if value == '0'
      end

      COLOUR_POLICY_AUTO
    end

    def term_is_dumb_

      value = env_nonempty_('TERM')

      !value.nil? && value.casecmp('dumb') == 0
    end
  end
end # module Woad


require 'woad/version'


# ############################## end of file ############################# #
