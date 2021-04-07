// https://stackoverflow.com/questions/44974592/rotate-a-string-in-c

void rot(char* s)
{
    char *tmp = strdup(s);
    int l=strlen(s);
    for (int i = 0; s[i] != 0; i++) {
        int j=(i+1)%l;
        tmp[j] = s[i];
    }
    memcpy(s, tmp, l);
    free(tmp);
}
