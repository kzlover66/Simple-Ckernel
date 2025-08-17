__attribute__((naked)) void main() {
    volatile char *video_memory = (volatile char *)0xB8000; // Video memory! addr 0xB8000
    const char *string = "Hello world!";
    
    // loop for print string
    const int color = 0x01;
    for(int n = 0x0; string[n] != '\0'; n++){
        video_memory[n * 2] = string[n];
        video_memory[n * 2 + 1] = color;
        video_memory[n * 2 + 2] = color;
    }

    while(1) __asm__("hlt");  // here we have a halt instruction to save power, just to this code dont run in a loop
}
