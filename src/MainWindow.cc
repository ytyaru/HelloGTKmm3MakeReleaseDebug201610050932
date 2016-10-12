#include <iostream>
#include "MainWindow.h"

MainWindow::MainWindow() : m_button("Hello World ボタン")
{
	set_border_width(10);
	m_button.signal_clicked().connect(sigc::mem_fun(*this, &MainWindow::on_button_clicked));
	add(m_button);
	m_button.show();
}
MainWindow::~MainWindow()
{
}
void MainWindow::on_button_clicked()
{
	std::cout << "Hello World" << std::endl;
	Gtk::MessageDialog diag( *this, "GTKmm3 Hello Worldですよ！", false, Gtk::MESSAGE_QUESTION, Gtk::BUTTONS_OK_CANCEL);
	diag.set_title( "タイトル" );

	switch( diag.run() ){
		case Gtk::RESPONSE_OK:
			break;
		case Gtk::RESPONSE_CANCEL:
			break;
	}
}
