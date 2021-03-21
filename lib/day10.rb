# frozen_string_literal: false

class Day10
  def initialize
    @bots = {}
    @outputs = {}
    @watch_bot_values = []
    @watch_bot_block = nil
  end

  def watch_bot_values values, &block
    @watch_bot_values = values.sort
    @watch_bot_block = block
  end

  def process_commands cmds
    cmds.each do |cmd|
      process_command(cmd)
    end
  end

  # rubocop:disable MethodLength, PerlBackrefs
  def process_command cmd
    if cmd =~ /value (\d+) goes to bot (\d+)/
      bot = get_or_init_target("bot", $2.to_i)
      bot[:values] << $1.to_i
    elsif cmd =~ /bot (\d+) gives low to (bot|output) (\d+) and high to (bot|output) (\d+)/
      bot = get_or_init_target("bot", $1.to_i)
      bot[:low_target] = $2, $3.to_i
      bot[:high_target] = $4, $5.to_i
    else
      raise "Bad command: #{cmd}"
    end
    process_bot(bot)
  end
  # rubocop:enable all

  def get_bot num
    @bots[num]&.dup
  end

  def get_output num
    @outputs[num]&.dup
  end

  private

  # rubocop:disable AbcSize, CyclomaticComplexity, MethodLength, ParallelAssignment
  def process_bot bot
    return unless !bot.nil? && bot[:values].length == 2 && bot.key?(:low_target) && bot.key?(:high_target)
    @watch_bot_block.call(bot) if !@watch_bot_block.nil? && bot[:values].sort == @watch_bot_values
    low_target, high_target = get_or_init_target(*bot[:low_target]), get_or_init_target(*bot[:high_target])
    low_target[:values] << bot[:values].min
    high_target[:values] << bot[:values].max
    bot[:values].clear
    [low_target, high_target].each {|target| process_bot(target) }
  end
  # rubocop:enable all

  def get_or_init_target type, num
    target = @bots if type == "bot"
    target = @outputs if type == "output"
    target[num] = {num: num, values: []} unless target.key?(num)
    target[num]
  end
end
