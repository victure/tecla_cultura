CKEDITOR.editorConfig = function( config ){  
	config.width = '850';
	config.height = '600';
	config.resize_enabled = false;
	config.toolbar_Custom =
	[
	    { name: 'document',    items : [ 'Source','-','Preview'] },
	    { name: 'clipboard',   items : [ 'Cut','Copy','Paste','-','Undo','Redo' ] },
	    { name: 'editing',     items : [ 'Find','Replace','-','SelectAll' ] },
	    '/',
	    { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Subscript','Superscript','-','RemoveFormat' ] },
	    { name: 'paragraph',   items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
	    { name: 'links',       items : [ 'Link','Unlink'] },
	    '/', 
        { name: 'styles',      items : [ 'Format','FontSize' ] },
	    { name: 'colors',      items : [ 'TextColor' ] }
	];    
	config.toolbar = 'Custom'
}