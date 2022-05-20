// https://www.codewars.com/kumite/6283eb3084bbe5005e73ab9b?sel=6283eb3084bbe5005e73ab9b


    use rand::seq::SliceRandom;



        let mut rng = thread_rng();
        let mut xs = (0..500).collect::<Vec<usize>>();
        xs.shuffle(&mut rng);
