import std.typecons;

Tuple!(ulong, ulong) minMax(ulong[] arr)
{
    return arr[1 .. $]
        .fold!((acc, n) 
               {
                   if (n < acc[0]) {
                       return tuple(n, acc[1]);
                   } else if (n > acc[1]) {
                       return tuple(acc[0], n);
                   } else {
                       return acc;
                   }
               }
              
              )(tuple(arr[0], arr[0]));
}


// Unnamed...
// https://www.codewars.com/kata/reviews/62ebda4140c3250001f19841/groups/62f0147f39db760001b86b1f
