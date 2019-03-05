require_relative 'insertion_sort'

def bucket_sort(collection, number_of_buckets=10)

  buckets = []
  final_collection = []

  # create the array of empty buckets
  number_of_buckets.times do
    buckets << []
  end

  # range of each bucket based on min and max value of sorted_collection
  b_range = ((collection.max - collection.min)/number_of_buckets).floor + 1

  # Put array elements n into different buckets based on range
  collection.each do |n|
    bucket_no = ((n - collection.min) / b_range).ceil    # zero is 1st bucket
    buckets[bucket_no] << n
  end

  # Sort individual buckets
  buckets.each do |b|
    final_collection << insertion_sort(b) if !b.empty?
  end

  final_collection.flatten
end
