
-module(factorial).

-export([factorial/1, test/0, sum_even_numbers/1, double_list/1, filter_odd_numbers/1, fold_example/1, is_prime/1, primes_up_to/1, test_primes/0]).

%% Factorial Functions

% Base case for factorial
factorial(0) -> 1;

% Recursive case for factorial
factorial(N) when N > 0 -> N * factorial(N - 1).

% Test function to demonstrate the factorial calculations
test() ->
    io:format("Factorial of 0: ~p~n", [factorial(0)]),
   
    io:format("Factorial of 1: ~p~n", [factorial(1)]),
  
    io:format("Factorial of 5: ~p~n", [factorial(5)]),
  
    io:format("Factorial of 10: ~p~n", [factorial(10)]),
  
    io:format("Sum of even numbers in [1,2,3,4,5]: ~p~n", [sum_even_numbers([1,2,3,4,5])]),
   
    io:format("Double of [1,2,3,4,5]: ~p~n", [double_list([1,2,3,4,5])]),
 
    io:format("Filter odd numbers from [1,2,3,4,5]: ~p~n", [filter_odd_numbers([1,2,3,4,5])]),

    io:format("Sum of [1,2,3,4,5] using fold: ~p~n", [fold_example([1,2,3,4,5])]),
 
    io:format("Is 7 prime? ~p~n", [is_prime(7)]),
  
    io:format("Is 10 prime? ~p~n", [is_prime(10)]),
  
    io:format("Primes up to 20: ~p~n", [primes_up_to(20)]),
    test_primes().

%% Summation of Even Numbers


% Sum even numbers in a list using recursion and guards
sum_even_numbers([]) -> 0;

sum_even_numbers([X | Xs]) when X rem 2 == 0 -> X + sum_even_numbers(Xs);

sum_even_numbers([_ | Xs]) -> sum_even_numbers(Xs).


%% List Operations

% Double each element in a list using lists:map and a lambda function
double_list(List) ->
    
    lists:map(fun(X) -> 2 * X end, List).

% Filter out odd numbers from a list using lists:filter and a lambda function
filter_odd_numbers(List) ->
    
    lists:filter(fun(X) -> X rem 2 == 1 end, List).

% Fold example to sum a list of numbers
fold_example(List) ->
    
    lists:foldl(fun(X, Acc) -> X + Acc end, 0, List).

%% Prime Number Functions


% Check if a number is prime using recursion and guards
is_prime(2) -> true;

is_prime(N) when N < 2 -> false;

is_prime(N) -> is_prime(N, 2).

% Helper function for is_prime
is_prime(N, D) when D * D > N -> true;

is_prime(N, D) when N rem D == 0 -> false;

is_prime(N, D) -> is_prime(N, D + 1).

% Generate a list of prime numbers up to a given limit
primes_up_to(Limit) ->
   
    lists:filter(fun(X) -> is_prime(X) end, lists:seq(2, Limit)).

% Test function for prime-related functions
test_primes() ->
    
    io:format("Testing primes up to 20:~n"),
   
    io:format("Primes: ~p~n", [primes_up_to(20)]),
   
    lists:foreach(fun(Prime) ->
                     
                      io:format("Is ~p prime? ~p~n", [Prime, is_prime(Prime)])
                 
                  end, primes_up_to(20)),
    ok.