int getSize (char * s) {
    char * t;    
    for (t = s; *t != '\0'; t++)
        ;
    return t - s;
}
