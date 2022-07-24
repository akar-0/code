fn transpose(matrix: &[Vec<u8>]) -> Vec<Vec<u8>> {
    let mut arr = vec![Vec::with_capacity(matrix.len()); matrix[0].len()];
    for row in matrix.iter() {
        for (j, cell) in row.iter().enumerate() {
            arr[j].push(*cell)
        }
    }
    arr.iter().rev().map(|x| x.clone()).collect()
}
