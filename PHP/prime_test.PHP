function is_prime(int $n): bool {
if ($n <= 1) return false;
if ($n == 2 || $n == 3 || $n == 5) return true;
for ($i = 2; $i <= sqrt($n); $i++) 
        if ($n % $i == 0) 
            return false;
return true; 
