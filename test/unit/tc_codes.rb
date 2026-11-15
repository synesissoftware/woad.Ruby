#! /usr/bin/env ruby

$:.unshift File.join(File.dirname(__FILE__), '../../lib')


require 'woad'

require 'test/unit'


class Test_codes < Test::Unit::TestCase

  def test_RESET

    assert_equal "\e[0m", Woad::RESET
  end

  def test_FG_RED

    assert_equal "\e[31m", Woad::FG_RED
  end

  def test_BG_BLUE

    assert_equal "\e[44m", Woad::BG_BLUE
  end

  def test_codes_are_csi_sgr

    [
      Woad::RESET,
      Woad::FG_BLACK,
      Woad::FG_BRIGHT_WHITE,
      Woad::BG_BLACK,
      Woad::BG_BRIGHT_WHITE,
    ].each do |code|

      assert code.start_with?("\e[")
      assert code.end_with?('m')
    end
  end
end
