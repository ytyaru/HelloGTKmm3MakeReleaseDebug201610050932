#ifndef MainWindow_H
#define MainWindow_H

#include <iostream>
#include <gtkmm.h>

class MainWindow : public Gtk::Window
{
public:
	MainWindow();
	virtual ~MainWindow();
protected:
	void on_button_clicked();
	Gtk::Button m_button;
};

#endif // MainWindow_H
