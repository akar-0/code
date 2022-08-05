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
