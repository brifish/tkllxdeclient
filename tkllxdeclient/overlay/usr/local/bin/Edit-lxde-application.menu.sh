#!/bin/bash
# By Brian Fisher <brifish@yahoo.com> 2013

changefile="/etc/xdg/menus/lxde-applications.menu"

search="<!-- End Settings -->"

replace="\n\n\
<!-- TKL_Workstation -->\n\
	<Menu>\n\
		<Name>TKL_Workstation<\/Name>\n\
		<Directory>TKL_Workstation.directory<\/Directory>\n\
		<Include>\n\
			<And>\n\
				<Category>TKL_Workstation<\/Category>\n\
			<\/And>\n\
		<\/Include>\n\
\n\
		<!-- TKL_Admin -->\n\
		<Menu>\n\
			<Name>TKL_Admin<\/Name>\n\
			<Directory>TKL_Admin.directory<\/Directory>\n\
			<Include>\n\
				<And>\n\
					<Category>TKL_Admin<\/Category>\n\
				<\/And>\n\
			<\/Include>\n\
		<\/Menu>\n\
		<!-- End TKL_Admin -->\n\
		<!-- TKL_Install -->\n\
		<Menu>\n\
			<Name>TKL_Install<\/Name>\n\
			<Directory>TKL_Install.directory<\/Directory>\n\
			<Include>\n\
				<And>\n\
					<Category>TKL_Install<\/Category>\n\
				<\/And>\n\
			<\/Include>\n\
		<\/Menu>\n\
		<!-- End TKL_Install -->\n\
		<!-- TKL_Reference -->\n\
		<Menu>\n\
			<Name>TKL_Reference<\/Name>\n\
			<Directory>TKL_Reference.directory<\/Directory>\n\
			<Include>\n\
				<And>\n\
					<Category>TKL_Reference<\/Category>\n\
				<\/And>\n\
			<\/Include>\n\
		<\/Menu>\n\
		<!-- End TKL_Reference -->\n\
\n\
	<\/Menu>\n\
<!-- End TKL_Workstation -->\n\n";

sed -i 's/'"$search"'/&'"$replace"'/' "$changefile"

