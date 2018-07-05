CONFIG -= qt
CONFIG += stl_off  

!CONFIG(DISABLE_WCHAR){
	#��wchar_tΪ��������
	QMAKE_CXXFLAGS += /Zc:wchar_t
}

!CONFIG(MBCS){
	CharacterSet = 1
}
else{
	CharacterSet = 2
	DEFINES -= UNICODE
}

CONFIG(USING_MT){
	#ʹ��MT����CRT
	QMAKE_CXXFLAGS_RELEASE += /MT
	QMAKE_CXXFLAGS_DEBUG += /MTd
}

CONFIG(debug, debug|release) {
	OBJECTS_DIR =   debug
	DESTDIR = debug
	CONFIG(x64){
		DESTDIR = $$DESTDIR"64"
	}	
	QMAKE_LIBDIR += $$DESTDIR
}
else {
	OBJECTS_DIR =   release
	DESTDIR = release
	CONFIG(x64){
		DESTDIR = $$DESTDIR"64"
	}
	QMAKE_LIBDIR += $$DESTDIR
}

CONFIG(x64){
	QMAKE_LFLAGS += /MACHINE:X64
	DEFINES -= WIN32
	DEFINES += _WIN64
             LIBPATH += $(SOUIPATH)/bin64
}
else{
	QMAKE_LFLAGS += /MACHINE:X86
             LIBPATH += $(SOUIPATH)/bin
}
#��˱���
QMAKE_CXXFLAGS += /MP
QMAKE_CXXFLAGS += -Fd$(IntDir)

DEPENDPATH += .
INCLUDEPATH += . \
			   $(SOUIPATH)/utilities/include \
			   $(SOUIPATH)/soui/include \
			   $(SOUIPATH)/components \
			   $(SOUIPATH)/config
