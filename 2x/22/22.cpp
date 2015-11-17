#include <iostream>
#include <fstream>
#include <cstring>

#define MAX_WORD_SIZE 25
#define MAX_WORDS     25000

using namespace std;

int main()
{
  ifstream fin("p022_names.txt");
  int numWords = 0;
  unsigned int counter = 1;
  char words[MAX_WORDS][MAX_WORD_SIZE];
  unsigned long score = 0;

  if(!fin.good())
    return 0;

  // read the CSV in
  while(fin.good())
  {
    if(counter++ % 2)
    {
      fin.ignore(MAX_WORD_SIZE, '"');
      continue;
    }
    fin.getline(words[numWords++], MAX_WORD_SIZE, '"');
  }

  fin.close();

  qsort(words, numWords, MAX_WORD_SIZE, (int (*)(const void*, const void*))strcmp);
  
  //make a hash of word -> position
  for(int i=0; i<numWords; i++)
  {
    int sum = 0;
    for(int j=0; j<strlen(words[i]); j++)
      sum += 1 + 'Z' - words[i][j];
    score += sum*(i+1);
  }

  cout << "Total score is: " << score << endl;

  return 0;
}


