__attribute__((naked)) void main() {
    volatile char *video_memory = (volatile char *)0xB8000; // here we have the video memory
    video_memory[0] = 'H'; // here we can add a char to be printed
    video_memory[1] = 0x01; // here we can define the color, 0x0F means white
    video_memory[2] = 'e'; // you can expand this code making a simple loop to print a complete string, that is not really hard to do
    video_memory[3] = 0x02;
    video_memory[4] = 'l';
    video_memory[5] = 0x03;
    video_memory[6] = 'l';
    video_memory[7] = 0x04;
    video_memory[8] = 'o';
    video_memory[9] = 0x05;
    video_memory[10] = ' ';
    video_memory[11] = 0x06;
    video_memory[12] = 'w';
    video_memory[13] = 0x07;
    video_memory[14] = 'o';
    video_memory[15] = 0x08;
    video_memory[16] = 'r';
    video_memory[17] = 0x0E;
    video_memory[18] = 'l';
    video_memory[19] = 0x0A;
    video_memory[20] = 'd';
    video_memory[21] = 0x0B;
    video_memory[22] = '!';
    video_memory[23] = 0x0C;
    while(1) __asm__("hlt");  // here we have a halt instruction to save power, just to this code dont run in a loop
}
