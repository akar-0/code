#diagonals
main_diag=lambda matrix: tuple(matrix[n][n] for n in range(len(matrix)))
main_diag_coord=lambda matrix: tuple((n, n) for n in range(len(matrix)))

diag2=lambda matrix: tuple(matrix[n][len(matrix)-n-1] for n in
        range(len(matrix)))
diag2_coord=lambda matrix: tuple((n, len(matrix)-n-1) for n in
        range(len(matrix)))

#transversals
trans_upleft_to_downright_without_corners=lambda matrix: [[(n, j-n) for n in
        range(j+1)] for j in range(1,len(matrix))] + [[(n, len(matrix)+j-n) for n in range(len(matrix)-1,j, -1)]
                for j in range(len(matrix)-1)] 

trans_downleft_to_upright_without_corners=lambda matrix: [[(n-1, n-j) for n in
        range(len(matrix),j-1, -1)] for j in range(len(matrix)-1, 0, -1)] + [
            [(n, n+j) for n in range(len(matrix)-j)
             ] for j in range(1,len(matrix)-1)] 
