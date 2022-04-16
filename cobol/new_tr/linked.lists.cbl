      * binary tree search
      * https://www.codewars.com/kumite/62540d9de5b26d0030426358?sel=62540d9de5b26d0030426358
      * find amplitude
      * https://www.codewars.com/kumite/6257f93fc7eedf006989e634?sel=6257f93fc7eedf006989e634
      * find max
      * https://www.codewars.com/kumite/62572fdd6a427a0061f14e01?sel=62572fdd6a427a0061f14e01
      *  sorted merge (allocate)
      * https://www.codewars.com/kumite/625a037643cbf60057048f5b?sel=625a037643cbf60057048f5b
      * length and count
      * https://www.codewars.com/kumite/61e854f08714760015d75b55?sel=61e854f08714760015d75b55
      
      *   tests to generate binary trees allocating dymamic memory
       identification division.
       program-id. tests.
      
       data division.
       working-storage section.
       01  head       usage pointer.
       01  depth      pic 9(2).
      
       procedure division.
           move 4 to depth
           call 'MakeBalancedTree'
           using head depth
           call 'DisplayTree'
           using by content head
           call 'FreeBinaryTree' using head
           display 'display NULL'
           call 'DisplayTree' using head
           .
      
       end program tests.
      
      * Single recursive function to create a balanced binary tree
       identification division.
       program-id. MakeBalancedTree recursive.

       data division.
      * doesn't work with `working-storage`
       local-storage section.
       01  d            pic 9(2).
      
       linkage section.
       01  node based.
           05 val        pic 9(2).
           05 nodeLeft   usage pointer.
           05 nodeRight  usage pointer.
       01  head       usage pointer.
       01  depth      pic 9(2).


       procedure division using head depth.
           if depth = 0
              set head to null
              goback
           end-if
      *    `initialized` useful only to set default values (val to 0, left-right to null)
           allocate node returning head
           move depth to val
           compute d = depth - 1
           call 'MakeBalancedTree' using nodeRight d
           call 'MakeBalancedTree' using nodeLeft d
           goback
            .
      
       end program MakeBalancedTree.
      
      * free binary trees
       identification division.
       program-id. FreeBinaryTree recursive.

       data division.
      * seems to work with `working-storage`
       local-storage section.
       01  rightNode    usage pointer.
       01  LeftNode     usage pointer.
      
       linkage section.
       01  node based.
           05 val        pic 9(2).
           05 nodeLeft   usage pointer.
           05 nodeRight  usage pointer.
       01  head       usage pointer.


       procedure division using head.
           if head = null then goback end-if
           set address of node to head
           set rightNode to nodeRight
           set LeftNode to nodeLeft
           free head
           call 'FreeBinaryTree' using leftNode
           call 'FreeBinaryTree' using RightNode
            .
      
       end program FreeBinaryTree.
      
      
      
      
       identification division.
       program-id. DisplayTree recursive.

       data division.
       local-storage section.
       01  storedRight  usage pointer.
       01  storedLeft   usage pointer.
       linkage section.
       01  node.
           05 val        pic 9(2).
           05 nodeLeft   usage pointer.
           05 nodeRight  usage pointer.
       01  head       usage pointer.

       procedure division using head .
           
           if head = null display 'NULL' goback end-if
           set address of node to head
           display 'VAL ' val
           move nodeRight to storedRight
           move nodeLeft to storedLeft
           call 'DisplayTree' using by content nodeRight
           call 'DisplayTree' using by content nodeLeft.
      
       end program DisplayTree.
      
      
