def smallest(array)
     sec_array = array.sort.first
    #  first_num = sec_array[0]
    #  first_num
    sec_array
  end
  
  def largest(array)

     last_array = array.sort.last
    #  last_num = sec_array.last
    #  last_num
  end


  def smallest_of_all(array)
    # your code here
   nested_array = [smallest(array)]
   nested_array.first
  end
  
  def largest_of_all(array)
    # your code here
   nested_array = array.split.to_i.sort
   nested_array.last
  end

  sec_test_array = [
    [98, -43, 7, -2, 19, 240],
    [1000, -2, 5, 3, 98, -32],
    [0, -9001, 7, -2, 8, 4321],
    [77, 0, 99, -23, -1, 345]
  ]

  
  test_array = [98, -43, 7, -2, 19, 240]
  puts smallest(test_array)
  puts largest(test_array)
#   puts smallest_of_all(sec_test_array)
 #puts largest_of_all(sec_test_array)