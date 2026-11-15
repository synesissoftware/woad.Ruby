#! /usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), '../../lib')


require 'woad'

require 'test/unit'


class Test_colour_policy < Test::Unit::TestCase

  ENV_NAMES_ = [
    'CLICOLOR',
    'CLICOLOR_FORCE',
    'FORCE_COLOR',
    'NO_COLOR',
    'TERM',
    'WOAD_COLOR',
    'WOAD_COLOUR',
  ].freeze

  class Writer_

    def initialize(attached)

      @attached = attached
    end

    def isatty

      @attached
    end
  end

  TERMINAL_ = Writer_.new(true)
  DETACHED_ = Writer_.new(false)

  def observe(assignments, attached)

    saved = {}

    ENV_NAMES_.each do |name|

      saved[name] = ENV.key?(name) ? ENV[name] : nil
      ENV.delete(name)
    end

    assignments.each do |name, value|

      ENV[name] = value
    end

    Woad.refresh

    io = attached ? TERMINAL_ : DETACHED_

    [
      Woad.colour_policy,
      Woad.supports_colour(io),
      Woad.seq_for(io, Woad::FG_RED),
      Woad.seq_for(io, nil),
    ]
  ensure

    ENV_NAMES_.each do |name|

      if saved[name].nil?

        ENV.delete(name)
      else

        ENV[name] = saved[name]
      end
    end

    Woad.refresh
  end

  def test_row_1_none_terminal

    policy, colour, seq, empty = observe({}, true)

    assert_equal Woad::COLOUR_POLICY_AUTO, policy
    assert_equal true, colour
    assert_equal Woad::FG_RED, seq
    assert_equal '', empty
  end

  def test_row_2_none_detached

    policy, colour, seq, empty = observe({}, false)

    assert_equal Woad::COLOUR_POLICY_AUTO, policy
    assert_equal false, colour
    assert_equal '', seq
    assert_equal '', empty
  end

  def test_row_3_term_dumb

    policy, colour, = observe({ 'TERM' => 'dumb' }, true)

    assert_equal Woad::COLOUR_POLICY_AUTO, policy
    assert_equal false, colour
  end

  def test_row_4_term_DUMB

    policy, colour, = observe({ 'TERM' => 'DUMB' }, true)

    assert_equal Woad::COLOUR_POLICY_AUTO, policy
    assert_equal false, colour
  end

  def test_row_5_woad_colour_1

    policy, colour, seq, = observe({ 'WOAD_COLOUR' => '1' }, false)

    assert_equal Woad::COLOUR_POLICY_FORCE, policy
    assert_equal true, colour
    assert_equal Woad::FG_RED, seq
  end

  def test_row_6_woad_color_always

    policy, colour, = observe({ 'WOAD_COLOR' => 'always' }, false)

    assert_equal Woad::COLOUR_POLICY_FORCE, policy
    assert_equal true, colour
  end

  def test_row_7_woad_colour_never

    policy, colour, = observe({ 'WOAD_COLOUR' => 'never' }, true)

    assert_equal Woad::COLOUR_POLICY_INHIBIT, policy
    assert_equal false, colour
  end

  def test_row_8_woad_colour_auto_terminal

    policy, colour, = observe({ 'WOAD_COLOUR' => 'auto' }, true)

    assert_equal Woad::COLOUR_POLICY_AUTO, policy
    assert_equal true, colour
  end

  def test_row_9_woad_colour_auto_detached

    policy, colour, = observe({ 'WOAD_COLOUR' => 'auto' }, false)

    assert_equal Woad::COLOUR_POLICY_AUTO, policy
    assert_equal false, colour
  end

  def test_row_10_woad_colour_purple

    policy, colour, = observe({ 'WOAD_COLOUR' => 'purple' }, true)

    assert_equal Woad::COLOUR_POLICY_AUTO, policy
    assert_equal true, colour
  end

  def test_row_11_no_color_outranks_force

    policy, colour, = observe({
      'CLICOLOR_FORCE' => '1',
      'NO_COLOR' => '1',
    }, true)

    assert_equal Woad::COLOUR_POLICY_INHIBIT, policy
    assert_equal false, colour
  end

  def test_row_12_clicolor_force

    policy, colour, = observe({ 'CLICOLOR_FORCE' => '1' }, false)

    assert_equal Woad::COLOUR_POLICY_FORCE, policy
    assert_equal true, colour
  end

  def test_row_13_clicolor_force_0_then_clicolor_0

    policy, colour, = observe({
      'CLICOLOR' => '0',
      'CLICOLOR_FORCE' => '0',
    }, true)

    assert_equal Woad::COLOUR_POLICY_INHIBIT, policy
    assert_equal false, colour
  end

  def test_row_14_force_color

    policy, colour, = observe({ 'FORCE_COLOR' => '1' }, false)

    assert_equal Woad::COLOUR_POLICY_FORCE, policy
    assert_equal true, colour
  end

  def test_row_15_force_color_false_then_clicolor_0

    policy, colour, = observe({
      'CLICOLOR' => '0',
      'FORCE_COLOR' => 'false',
    }, true)

    assert_equal Woad::COLOUR_POLICY_INHIBIT, policy
    assert_equal false, colour
  end

  def test_row_16_force_color_FALSE_detached

    policy, colour, = observe({ 'FORCE_COLOR' => 'FALSE' }, false)

    assert_equal Woad::COLOUR_POLICY_AUTO, policy
    assert_equal false, colour
  end

  def test_row_17_force_color_0_terminal

    policy, colour, = observe({ 'FORCE_COLOR' => '0' }, true)

    assert_equal Woad::COLOUR_POLICY_AUTO, policy
    assert_equal true, colour
  end

  def test_row_18_clicolor_0

    policy, colour, = observe({ 'CLICOLOR' => '0' }, true)

    assert_equal Woad::COLOUR_POLICY_INHIBIT, policy
    assert_equal false, colour
  end

  def test_row_19_clicolor_1

    policy, colour, = observe({ 'CLICOLOR' => '1' }, true)

    assert_equal Woad::COLOUR_POLICY_AUTO, policy
    assert_equal true, colour
  end

  def test_row_20_empty_woad_colour_is_absent

    policy, colour, = observe({
      'NO_COLOR' => '1',
      'WOAD_COLOUR' => '',
    }, true)

    assert_equal Woad::COLOUR_POLICY_INHIBIT, policy
    assert_equal false, colour
  end

  def test_row_21_empty_no_color_is_absent

    policy, colour, = observe({ 'NO_COLOR' => '' }, true)

    assert_equal Woad::COLOUR_POLICY_AUTO, policy
    assert_equal true, colour
  end

  def test_row_22_refresh_drops_the_cache

    saved = {}

    ENV_NAMES_.each do |name|

      saved[name] = ENV.key?(name) ? ENV[name] : nil
      ENV.delete(name)
    end

    ENV['WOAD_COLOUR'] = '1'
    Woad.refresh

    assert_equal Woad::COLOUR_POLICY_FORCE, Woad.colour_policy
    assert_equal true, Woad.supports_colour(TERMINAL_)

    ENV.delete('WOAD_COLOUR')
    ENV['NO_COLOR'] = '1'

    assert_equal Woad::COLOUR_POLICY_FORCE, Woad.colour_policy
    assert_equal true, Woad.supports_colour(TERMINAL_)

    Woad.refresh

    assert_equal Woad::COLOUR_POLICY_INHIBIT, Woad.colour_policy
    assert_equal false, Woad.supports_colour(TERMINAL_)
  ensure

    ENV_NAMES_.each do |name|

      if saved[name].nil?

        ENV.delete(name)
      else

        ENV[name] = saved[name]
      end
    end

    Woad.refresh
  end

  def test_force_ignores_term_dumb

    policy, colour, = observe({
      'TERM' => 'dumb',
      'WOAD_COLOUR' => 'yes',
    }, false)

    assert_equal Woad::COLOUR_POLICY_FORCE, policy
    assert_equal true, colour
  end
end
