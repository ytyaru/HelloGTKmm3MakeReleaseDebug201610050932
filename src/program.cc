#include <iostream>
#include <gtkmm.h>
#include "MainWindow.h"
int main(int argc, char* argv[])
{
	auto app = Gtk::Application::create(argc, argv, "org.gtkmm.example");
	MainWindow mainWindow;
	return app->run(mainWindow);
	return 0;
}
