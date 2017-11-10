#checking for floats use... input.include?(".") ? input.to_f : input.to_i

def calc
  puts "===Welcome to Calculator==="

  @calc_history = []

  calculations
end

def calculations
  puts "Enter math expression: example: a + b"
  print ">"
  expression = gets.strip

  exp_arr = expression.split(" ")

  if exp_arr.length === 3

      num1 = exp_arr[0]
      num1 = check_num(num1)


      num2 = exp_arr[2]
      num2 = check_num(num2)

      op = exp_arr[1]
      op = op_test(op)

      puts "Calculating..."
      puts "---------------"

      math_calc = "#{num1} #{op} #{num2} = #{num1.send(op, num2).round(5)}"
      puts math_calc
      @calc_history << math_calc
      @running_total = num1.send(op, num2)

      calc_options
  else
    puts "Expression must match example"
    calculations
  end

end

def calc_options
  puts "1) New calculation - Clear Calculator"
  puts "2) Continue calculation"
  puts "3) Calculator History"
  puts "4) Exit"
  print ">"

  option = gets.strip.to_i


    case option
      when 1
        calc
      when 2
        calc_continue
      when 3
        puts "------History------"
        @calc_history.each {|hist| puts hist}
        puts "-------------------"
        calc_options
      when 4
        exit 0
      else
        puts "Enter a Valid command"
        calc_options
    end

end


def calc_continue()
  print "> #{@running_total} "
  input = gets.strip

  input_arr = input.split(" ")

  if input_arr.length === 2

    op = input_arr[0]
    op = op_test(op)

    num2 = input_arr[1]
    num2 = check_num(num2)


    puts "Calculating..."
    puts "---------------"

    math_calc = "#{@running_total} #{op} #{num2} = #{@running_total.send(op, num2).round(5)}"
    puts math_calc
    @calc_history << math_calc
    @running_total = @running_total.send(op, num2)

  else
    puts "Expression must match example"
    calc_continue
  end

  calc_options
end

def check_num(num)
  if num[/^[0-9]\d*(\.\d+)?$/].nil?
    puts "Your numbers are invalid, try again."
    print ">"
    num = gets.strip
    check_num(num)
  else
    return num.include?(".") ? num.to_f : num.to_i
  end
end

def op_test(op)
  if (op == "+") || (op == "-") || (op == "/") || (op == "*")
    return op
  else
    puts "Valid operators only"
    print "> New input"
    op = gets.strip
    op_test(op)
  end
end

calc
