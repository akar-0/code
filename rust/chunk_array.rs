fn chunk(arr: Vec<i32>, h: i32) -> Vec<i32> {
    let l=arr.len();
    let mut a:Vec<i32> = Vec::new();
    let mut o:Vec<i32> = Vec::new();
    let mut x=h;
    if x < 0 {
        for i in (0..l).rev() {
            a.push(arr[i]);
        }
        x*=-1;
    } else {
        for i in 0..l {
            a.push(arr[i]);
        }
    }
    let step=x as usize;
    for i in (0..a.len()).step_by(step) {
        o.push(a[i]);
    }
    o
}
