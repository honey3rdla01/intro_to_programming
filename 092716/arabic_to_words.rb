def convert_to_word(a)
  numbers_hash = Hash.new(0)
  numbers_hash = {
    0 =>"Zero",1 =>"One",2 =>"Two",3 => "Three",4 => "Four",5 => "Five",6 => "Six",7 => "Seven",8 => "Eigth",9=>"Nine",10=>"Ten",11=>"Eleven",12=>"Twelve",13=>"Thirteen",
    14=>"Fourteen",15=>"Fifteen",16=>"Sixteen",17=>"Seventeen",18=>"Eigtheen",19=>"Nineteen",20=>"Twenty",30=>"Thirty",40=>"Forty",50=>"Fifty",60=>"Sixty",70=>"Seventy",80=>"Eighty",90=>"Ninty",100=>"Hundred"
  }

  word = ""

  if a.length == 1
    word += numbers_hash[a[0]]
  elsif a.length == 2
    if (a[0]*10)+a[1]>20 && ((a[0]*10)+a[1])%10!=0
    word += numbers_hash[a[0]*10] +"-" +numbers_hash[a[1]]
    else
    word += numbers_hash[(a[0]*10)+a[1]]
    end
  elsif a.length == 3
    word += numbers_hash[a[0]] + " Hundred and "
    if (a[1]*10)+a[1]>20 && ((a[1]*10)+a[2])%10!=0
    word += numbers_hash[a[1]*10] +"-" +numbers_hash[a[2]]
    else
    word += numbers_hash[(a[1]*10)+a[2]]
    end
  end
  word
end


#This code takes integer numbers and converts it to words
puts "Input a number"
num = gets.chomp
number = num.to_i
a = num.split("")
#a.map! {|i| i.to_i}
#stores the different segments of the number in 3's
w=[]
x=[]
y=[]
z=[]

#num=9874783678
#some mathematical gymnastics to get the different parts of the code and
#mapping it to a variable
  b = number/1000000000
  #9
  b1=b.to_s
  b_b = b1.split("")
  b_b.map!{|i| i.to_i}

  e = number%1000000000
  #876453231
  s = e/1000000
  s1=s.to_s
  s_s= s1.split("")
  s_s.map! {|i| i.to_i}
  #876

  t = e%1000000
  m=t/1000
  #453
  m1=m.to_s
  m_m= m1.split("")
  m_m.map! {|i| i.to_i}

  ex=t%1000
  #231
  ex1=ex.to_s
  ex_ex= ex1.split("")
  ex_ex.map! {|i| i.to_i}

#check the length of the number and determine the methods to run on it

if a.length > 11
  puts "Number length too long"
elsif a.length > 9
  print "#{convert_to_word(b_b)} Billion #{convert_to_word(s_s)} Million #{convert_to_word(m_m)} Thousand #{convert_to_word(ex_ex)}"
  puts ""
elsif a.length > 6
  print "#{convert_to_word(s_s)} Million #{convert_to_word(m_m)} Thousand #{convert_to_word(ex_ex)}"
  puts ""
elsif a.length > 3
  print "#{convert_to_word(m_m)} Thousand #{convert_to_word(ex_ex)}"
  puts ""
else
  print "#{convert_to_word(ex_ex)}"
  puts ""
end
