using System;
using System.IO;
using SDL2;


namespace Ernest
{
    class Program
    { 
        private const string EXT_NES = ".nes";
        private const int ARG_INDEX_PATH = 0;
        private const int ARG_INDEX_NAME = 1;
        private const int ERR_FORMAT = 2;

        private static Port _PrimaryPort;

        private static bool Running = true;

        private static IntPtr Window = IntPtr.Zero;
        private static IntPtr Renderer = IntPtr.Zero;
        private static IntPtr PrimarySurface;

        private const int WindowWidth = 1024;
        private const int WindowHeight = 768;


        static void Main(string[] args)
        {
            if (Path.GetExtension(args[ARG_INDEX_PATH]) != EXT_NES)
                Environment.Exit(ERR_FORMAT);
            _PrimaryPort.Rom = new ROM(args[0], out _PrimaryPort);
            CPU.Access.Update();
            //Execute(args);
        }


        public static int Execute(String[] args)
        {
            if (!Init())
                return 0;

            SDL.SDL_Event Event;
            while (Running)
            {
                while (SDL.SDL_PollEvent(out Event) != 0)
                {
                    OnEvent(Event);
                    if (Event.type == SDL.SDL_EventType.SDL_QUIT)
                    {
                        Running = false;
                    }
                }
                Loop();
                Render();

                SDL.SDL_Delay(1);
             
            }
            Cleanup();

            return 1;
        }

        public static void OnEvent (SDL.SDL_Event Event)
		{
		}

        public static void Cleanup()
        {
            if (Renderer != IntPtr.Zero)
            {
                SDL.SDL_DestroyRenderer(Renderer);
                Renderer = IntPtr.Zero;
            }

            if (Window != IntPtr.Zero)
            {
                SDL.SDL_DestroyWindow(Window);
                Window = IntPtr.Zero;
            }

            SDL.SDL_Quit();
        }

        public static int GetWindowWidth()
        {
            return WindowWidth;
        }

        public static int GetWindowHeight()
        {
            return WindowHeight;
        }

        public static void Loop()
        {
        }

        public static void Render()
        {
            SDL.SDL_RenderClear(Renderer);
            SDL.SDL_RenderPresent(Renderer);
        }

        public static bool Init()
        {

            if (SDL.SDL_Init(SDL.SDL_INIT_VIDEO) < 0)
                return false;

            if (SDL.SDL_SetHint(SDL.SDL_HINT_RENDER_SCALE_QUALITY, "1") == SDL.SDL_bool.SDL_FALSE)
            {
                // some problem
            }

            if ((Window = SDL.SDL_CreateWindow("Moja nazwa", SDL.SDL_WINDOWPOS_UNDEFINED, SDL.SDL_WINDOWPOS_UNDEFINED, WindowWidth, WindowHeight, SDL.SDL_WindowFlags.SDL_WINDOW_SHOWN)) == IntPtr.Zero)
            {
                return false;
            }

            PrimarySurface = SDL.SDL_GetWindowSurface(Window);

            if ((Renderer = SDL.SDL_CreateRenderer(Window, -1, SDL.SDL_RendererFlags.SDL_RENDERER_ACCELERATED)) == IntPtr.Zero)
            {
                return false;
            }

            SDL.SDL_SetRenderDrawColor(Renderer, 0xae, 0xFF, 0x00, 0xFF);

            return true;
        }
    }
}
