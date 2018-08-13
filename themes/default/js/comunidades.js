function showError(obj) {
	$(obj).addClass('error').focus(); // TODO QUE ONDA
	$.scrollTo($(obj), 500);
}
function hideError(obj) {
	$(obj).removeClass('error');
}
function cgget(data, sin_amp){
	var r = data+'=';
	if(!sin_amp)
		r = '&'+r;
	switch(data){
		case 'comid':
			if(global_com.comid!='')
				return r+parseInt(global_com.comid);
			break;
		case 'temaid':
			if(global_com.temaid!='')
				return r+parseInt(global_com.temaid);
			break;
	}
	return '';
}
var com = {
	required: function() {
		var error = false;
        $('.required').each(function(){
        	if ($(this).val() == '' || $(this).val() == 0) {
        		showError(this);
        		error = true;
        		return false;
        	} else {
				hideError(this);
				error = false;
			}
        });
        if (error) return false;
		else return true;
	},
	subcat: function() {
		hideError($('#ShowCats'));		
		var cid = $('#ShowCats').val();
		if(cid > 0)
		$.ajax({
			type: 'POST',
			url: global_data.url +'/comunidades-subcategorias.php',
			data: 'cid='+cid,
			success: function(h){
				$('#ShowSubcats').removeAttr('disabled');
				$('#ShowSubcats').html(h);
			}
		});
		else $('#ShowSubcats').html('<option value="0">Selecciona una categor&iacute;a</option>').attr({'disabled' : 'disabled'});
	},
	crear_comunidad: function() {
		if(com.required()) {
			$('#add_new_com').submit();
		}
	},
	crear_tema: function() {
		if(com.required()) {
			mydialog.class_aux = 'com_tema';
			mydialog.show(true);
			mydialog.title('Previsualizar');
			mydialog.body('Cargando vista previa....<br><br><img src="' + global_data.url + '/themes/default/images/loading_bar.gif">');
			mydialog.buttons(false);
            mydialog.center();
            // PREVIEW
			$.ajax({
				type: 'post',
				url: global_data.url + '/comunidades-preview_tema.php',
				data: 'titulo=' + encodeURIComponent($('input[name=titulo]').val()) + '&cuerpo=' + encodeURIComponent($('textarea[name=cuerpo]').val()),
				success: function(h) {
					mydialog.body(h);
					mydialog.buttons(true, true, 'agregar tema', 'com.save_tema();', true, true, true, 'Cerrar previsualizaci&oacute;n', 'close', true, false);
					$('#buttons > a').removeClass('mBtn');
					$('#buttons > a').addClass('input_button ibg');
					mydialog.center();
					$.scrollTo(0, 500)

				}
			});
		}
	},	
	save_tema: function() {
		$('#add_new_tema').submit();	
	},
	ver_mas: function() {
		var enl = $('#view_more');
		var mas = $('#show_more');
		if(mas.css('display') == 'none') {
			enl.text('Ver menos');
			mas.show();
		} else {
			enl.text('Ver más');
			mas.hide();
		}
	},
	borrar:function(comid, gew){
		if(!gew){
			mydialog.show();			
			mydialog.title('Eliminar Comunidad');			
			mydialog.body('&#191;Quieres eliminar esta comunidad?');			
			mydialog.buttons(true, true, 'S&iacute;', 'com.borrar(' + comid + ', 1)', true, false, true, 'No', 'close', true, true);			
			mydialog.center();			
		}else{
			mydialog.procesando_inicio();	  
			$('#loading').fadeIn(250);   
			$.ajax({
				type: 'post',
				url: global_data.url + '/comunidades-borrar_com.php',
				data: 'comid=' + comid + '&susp=1',
				success: function(h) {
					mydialog.alert((h.charAt(0) == '0' ? 'Opps!' : 'Hecho'), h.substring(3), true);
				}
			});
			$('#loading').fadeOut(350);
			mydialog.procesando_fin();
		}
	},
	ir_a_categoria: function(cat) {
		if(cat!='root' && cat!='linea');
		if(cat==-1) document.location.href= global_data.url + '/comunidades/';
		else document.location.href= global_data.url + '/comunidades/home/' + cat + '/';
	},
	pop_list_change: function(time) {
		$('#com_change_hover').text(time);
		$('#com_change_list').hide();
		switch(time) {
			case 'Semana':
				$('.pop_list_semana').addClass('active');
				$('.pop_list_mes').removeClass('active');
				$('.pop_list_historico').removeClass('active');
				$('#ccp_semana').show();
				$('#ccp_mes').hide();
				$('#ccp_historico').hide();
			break;
			case 'Mes':
				$('.pop_list_semana').removeClass('active');
				$('.pop_list_mes').addClass('active');
				$('.pop_list_historico').removeClass('active');
				$('#ccp_semana').hide();
				$('#ccp_mes').show();
				$('#ccp_historico').hide();
			break;
			case 'Historico':
				$('.pop_list_semana').removeClass('active');
				$('.pop_list_mes').removeClass('active');
				$('.pop_list_historico').addClass('active');
				$('#ccp_semana').hide();
				$('#ccp_mes').hide();
				$('#ccp_historico').show();
			break;
		}
		$('#ccp_'+time).show();
	},
	add_respuesta: function() {
		// EVITAR FLOOD
		$('#btn_newcom').attr({'disabled':'disabled'});
		var text = $('#markit_resp').val();
		// ESTA VACIO?
		if(text == ''){
			$('#markit_resp').focus();
			$('#btn_newcom').removeAttr('disabled');
			return;
		}else if(text.length > 1500){
			mydialog.alert("Tu comentario no puede ser mayor a 1500 caracteres.");
			$('#markit_resp').focus();
			$('#btn_newcom').removeAttr('disabled');
			return;
		}
		$('#loading').fadeIn(250);                                 
		$.ajax({
			type: 'POST',
			url: global_data.url + '/comunidades-responder.php',
			data: 'body=' + encodeURIComponent(text) + cgget('temaid'),
			success: function(h){
				if(h.charAt(0) == '0'){
					$('.com_bigmsj_red').html(h.substring(3)).show('fast');
					$('#btn_newcom').removeAttr('disabled');
				} else {					
					$('#markit_resp').val('');
					$('#add_new_com').html(h).slideDown('slow', function () {
						$('.com_bigmsj_blue').hide('fast');
						$('.com_bigmsj_red').hide('fast');
						$(this).attr({'id' : 'old_msj'});
					});
					// SUMAMOS
					var com_total = parseInt($('#cbt_val').text());
					$('#cbt_val').text(com_total + 1);
					$('#btn_newcom').removeAttr('disabled');
				}
				$('#loading').fadeOut(350);
				mydialog.close();
			}
		});
	},
	unirme: function() {
		$('#loading').fadeIn(250);
		$.ajax({
			type: 'POST',
			url: global_data.url + '/comunidades-unirme.php',
			data: cgget('comid', true),
			success: function(h){
				if(h.charAt(0) == 1) {
					$('.action_comunidad').toggle();
					location.reload();
				} else {
					mydialog.alert('Error', h.substring(3));
				}
			}
		});
	},
	abandonar: function(gew) {
		if(!gew) {
			mydialog.show();
			mydialog.title('Abandonar comunidad')
			mydialog.body('&iquest;Realmente deseas abandonar la comunidad?');
			mydialog.buttons(true, true, 'Aceptar', 'com.abandonar(true)', true, false, true, 'Cancelar', 'close', true, true);
			mydialog.center();
		} else {
		mydialog.procesando_inicio();
		$('#loading').fadeIn(250);
			$.ajax({
				type: 'POST',
				url: global_data.url + '/comunidades-abandonar.php',
				data: cgget('comid', true),
				success: function(h){
					if(h.charAt(0) == 1) {
						$('.action_comunidad').toggle();
						location.reload();
						mydialog.close();
					} else {
						mydialog.procesando_fin();
						mydialog.alert('Error', h.substring(3));
					}
				}
			});
		}
	},
	seguir_com: function() {
		$('#loading').fadeIn(250);
		$.ajax({
			type: 'POST',
			url: global_data.url + '/comunidades-seguir_com.php',
			data: cgget('comid', true),
			success: function(h){
				$('#loading').fadeOut(250);
				if(h.charAt(0) == '1') {
					$('#follow_com').hide();
					$('#unfollow_com').hide();
					$('#unfollow_comr').show();
					var total = parseInt($('#com_seguidores_total').text())+1;
				} else if(h.charAt(0) == '2') {
					$('#unfollow_comr').hide();
					$('#unfollow_com').hide();
					$('#follow_com').show();
					var total = parseInt($('#com_seguidores_total').text())-1;
				} else {
					mydialog.alert('Error', h.substring(3));
				}
				$('#com_seguidores_total').text(total);
			}
		});
	},
	seguir_tema: function() {
		$('#loading').fadeIn(250);
		$.ajax({
			type: 'POST',
			url: global_data.url + '/comunidades-seguir_tema.php',
			data: cgget('temaid', true),
			success: function(h){
				$('#loading').fadeOut(250);
				if(h.charAt(0) == '1') {
					$('#follow_tema').hide();
					$('#unfollow_tema').hide();
					$('#unfollow_temar').show();
					var total = parseInt($('#segs_total').text())+1;
				} else if(h.charAt(0) == '2') {
					$('#unfollow_temar').hide();
					$('#unfollow_tema').hide();
					$('#follow_tema').show();
					var total = parseInt($('#segs_total').text())-1;
				} else {
					mydialog.alert('Error', h.substring(3));
				}
				$('#segs_total').text(total);
			}
		});
	},
	citar_com: function(id, nick) {
		var textarea = $('#markit_resp');
		textarea.focus();
		textarea.val(((textarea.val() != '') ? textarea.val() + '\n' : '') + '[quote=' + nick + ']' + htmlspecialchars_decode($('#coment_source_'+id).html(), 'ENT_NOQUOTES') + '[/quote]\n');
	},
	subir_imagen: function() {
		$('#loading').fadeIn(250);
		if ($('#cei_input').val()) {
			if(isImageFile($('#cei_input').val())){
				$('#cei_cambio').css({'opacity' : 0.5});
				$.ajaxFileUpload({
					url: global_data.url + '/comunidades-edit_imagen.php?' + cgget('comid', true),
					fileElementId: 'cei_input',
					dataType: 'json',
					success: function(h){
						if(h.charAt(0) == 1) {
							$('#cei_cambio').css({'opacity' : 1});
							$('#cei_cambio').attr({'src' : h.substring(3) + '?' + new Date().getTime()});
						} else {
							mydialog.alert('Error', h.substring(3));
						}				
						$('#loading').fadeOut(250);
					}
				});
			} else mydialog.alert('Error', 'El archivo no es una imagen válida.');
		} else mydialog.alert('Error', 'No selecciono ningun archivo.');
	},
	subir_fondo: function() {
		$('#loading').fadeIn(250);
		if ($('#cef_input').val()) {
			if(isImageFile($('#cef_input').val())){
				$('#cef_cambio').css({'opacity' : 0.5});
				$.ajaxFileUpload({
					url: global_data.url + '/comunidades-edit_fondo.php?' + cgget('comid', true),
					fileElementId: 'cef_input',
					dataType: 'json',
					success: function(h){
						if(h.charAt(0) == 1) {
							$('#cef_cambio').css({'opacity' : 1});
							$('#cef_cambio').attr({'src' : h.substring(3) + '?' + new Date().getTime()});
						} else {
							mydialog.alert('Error', h.substring(3));
						}				
						$('#loading').fadeOut(250);
					}
				});
			} else mydialog.alert('Error', 'El archivo no es una imagen válida.');
		} else mydialog.alert('Error', 'No selecciono ningun archivo.');
	},
	votar_tema: function(voto) {
		$('#loading').fadeIn(250);
		voto = (voto == 'pos') ? 'pos' : 'neg';
		var votos = $('#votos_total');
		var total_votos = parseInt(votos.text());
        total_votos = (isNaN(total_votos)) ? 0 : total_votos;
		$.ajax({
			type: 'POST',
			url: global_data.url + '/comunidades-votar_tema.php',
			data: 'voto=' + voto + cgget('temaid'),
			success: function(h){
				if(h.charAt(0) == 1) {
					result = (voto == 'pos') ? parseInt(total_votos+1) : parseInt(total_votos-1);
					if(result < 0) {
						votos.css({'color' : 'red'}).text(result);
					} else if(result > 0) {
						votos.css({'color' : 'green'}).text(result);
					} else {
						votos.css({'color' : '#222'}).text(result);
					}
				} else {
					mydialog.alert('Error', h.substring(3));
				}
			}
		});
		$('#loading').fadeOut(250);
	},
	votar_respuesta: function(rid, voto) {
		$('#loading').fadeIn(250);
		voto = (voto == 'pos') ? 'pos' : 'neg';
		var comm = $('#total_votos_' + rid);
		var total_votos = parseInt(comm.text());
        total_votos = (isNaN(total_votos)) ? 0 : total_votos;
		$.ajax({
			type: 'POST',
			url: global_data.url + '/comunidades-votar_respuesta.php',
			data: 'voto=' + voto +  '&rid=' + rid,
			success: function(h){
				if(h.charAt(0) == 1) {
					result = (voto == 'pos') ? parseInt(total_votos+1) : parseInt(total_votos-1);
					if(result < 0) {
						comm.css({'color' : 'red'}).text(result);
					} else if(result > 0) {
						comm.css({'color' : 'green'}).text('+' + result);
					} else {
						comm.css({'color' : '#999'}).text(result);
					}
				} else {
					mydialog.alert('Error', h.substring(3));
				}
			}
		});
		$('#loading').fadeOut(250);
	},
	add_favorito: function() {
		$('#loading').fadeIn(250);
		var total_favs = parseInt($('#favs_total').text());
        total_favs = (isNaN(total_favs)) ? 0 : total_favs;
		$.ajax({
			type: 'POST',
			url: global_data.url + '/comunidades-add_favorito.php',
			data: cgget('temaid'),
			success: function(h){
				if(h.charAt(0) == 1) {
					$('.add_favorito').toggle();
					$('#favs_total').text(total_favs + 1)
				} else {
					mydialog.alert('Error', h.substring(3));
				}
			}
		});
		$('#loading').fadeOut(250);
	},
	reco_tema: function (gew) {
		if(!gew) {
			mydialog.show();
			mydialog.title('Recomendar');
			mydialog.body('¿Quieres recomendar este tema a tus seguidores?');
			mydialog.buttons(true, true, 'Recomendar', 'com.reco_tema(true)', true, true, true, 'Cancelar', 'close', true, false);
			mydialog.center();
		} else {
			mydialog.procesando_inicio();
			$.ajax({
				type: 'POST',
				url: global_data.url + '/comunidades-reco_tema.php',
				data: cgget('temaid'),
				success: function(h){
					mydialog.procesando_fin();
					if(h.charAt(0) == 1) {
						mydialog.alert('&Eacute;xito', h.substring(3));						
						$('.share-t-count').text(parseInt($('.share-t-count').text())+1);
					} else {
						mydialog.alert('Error', h.substring(3));
					}
				}
			});
		}
	},
	del_tema: function(gew) {
		if(!gew) {
			mydialog.show();
			mydialog.title('Eliminar tema');
			mydialog.body('&iquest;Seguro que deseas borrar tu tema?');
			mydialog.buttons(true, true, 'Eliminar', 'com.del_tema(true)', true, true, true, 'Cancelar', 'close', true, false);
			mydialog.center();
		} else {
			mydialog.procesando_inicio();
			$.ajax({
				type: 'POST',
				url: global_data.url + '/comunidades-del_tema.php',
				data: cgget('temaid', true),
				success: function(h){
					mydialog.procesando_fin();
					if(h.charAt(0) == 1) {
						mydialog.alert('&Eacute;xito', h.substring(3), true);
					} else {
						mydialog.alert('Error', h.substring(3));
					}
				}
			});
		}
	},
	del_mod_tema: function(gew) {
		if(!gew) {
			mydialog.show();
			mydialog.title('Eliminar tema');
			mydialog.body('&iquest;Seguro que deseas borrar este tema?<br /><br /><input type="text" class="input_text" id="del_razon" maxlength="80" placeholder="Causa..." />');
			mydialog.buttons(true, true, 'Eliminar', 'com.del_mod_tema(true)', true, true, true, 'Cancelar', 'close', true, false);
			mydialog.center();
		} else {
			var razon = $('#del_razon').val();
			mydialog.procesando_inicio();
			$.ajax({
				type: 'POST',
				url: global_data.url + '/comunidades-del_tema.php',
				data:  'razon=' + razon + cgget('temaid'),
				success: function(h){
					mydialog.procesando_fin();
					if(h.charAt(0) == 1) {
						mydialog.alert('&Eacute;xito', h.substring(3), true);
					} else {
						mydialog.alert('Error', h.substring(3));
					}
				}
			});
		}
	},
	reactivar_tema: function(gew) {
		if(!gew) {
			mydialog.show();
			mydialog.title('Reactivar tema');
			mydialog.body('&iquest;Seguro que deseas reactivar este tema?');
			mydialog.buttons(true, true, 'Reactivar', 'com.reactivar_tema(true)', true, true, true, 'Cancelar', 'close', true, false);
			mydialog.center();
		} else {
			mydialog.procesando_inicio();
			$.ajax({
				type: 'POST',
				url: global_data.url + '/comunidades-reactivar_tema.php',
				data:  cgget('temaid', true),
				success: function(h){
					mydialog.procesando_fin();
					if(h.charAt(0) == 1) {
						mydialog.alert('&Eacute;xito', h.substring(3), true);
					} else {
						mydialog.alert('Error', h.substring(3));
					}
				}
			});
		}
	},
	del_respuesta: function(rid) {
		$('#loading').fadeIn(250);
		$.ajax({
			type: 'POST',
			url: global_data.url + '/comunidades-del_respuesta.php',
			data: 'rid=' + rid,
			success: function(h){
				if(h.charAt(0) == 1) {
					$('#coment_id_' + rid).fadeOut(100, function(){ 
						$(this).remove();
					});
				} else {
					mydialog.alert('Error', h.substring(3));
				}
			}
		});
		$('#loading').fadeOut(250);
	},
	pages_temas: function(page) {
		$('#loading').fadeIn(250);
		$('#result_temas').css({'opacity' : 0.5});
		$.ajax({
			type: 'POST',
			url: global_data.url + '/comunidades-pages_temas.php',
			data: cgget('comid') + '&page=' + page,
			success: function(h){
				$('#result_temas').html(h);
				$('#result_temas').css({'opacity' : 1});
			}
		});
		$('#loading').fadeOut(250);
	},
	pages_respuestas: function(page) {
		$('#loading').fadeIn(250);
		$('#result_answers').css({'opacity' : 0.5});
		$.ajax({
			type: 'POST',
			url: global_data.url + '/comunidades-pages_respuestas.php',
			data: cgget('temaid') + '&page=' + page,
			success: function(h){
				$('#result_answers').html(h);
				$('#result_answers').css({'opacity' : 1});
			}
		});
		$('#loading').fadeOut(250);
	},
	member_admin: function(userid) {
		$('#loading').fadeIn(250);
		$.ajax({
			type: 'POST',
			url: global_data.url + '/comunidades-member_admin.php',
			data: cgget('comid') + '&userid=' + userid,
			success: function(h){
				if(h.charAt(0) == 0) {
					mydialog.alert('Error', h.substring(3));
				} else {
					mydialog.show();
					mydialog.title('Moderar usuario');
					mydialog.body(h);
					mydialog.buttons(true, true, 'Aceptar', 'com.member_admin_submit()', true, true, true, 'Cancelar', 'close', true, false);
					mydialog.center();
				}
			}
		});
		$('#loading').fadeOut(250);
	},
	member_admin_submit: function() {
		mydialog.procesando_inicio();
		var type = $('input[name="type"]').attr('checked');
		if(type == 'checked') type = 1;
		else type = 2;
		var rango = $('select[name="rango"]').val();
		var tiempo = $('input[name="tiempo"]').attr('checked');
		if(tiempo == 'checked') tiempo = 0;
		else tiempo = 1;
		var causa = $('input[name="causa"]').val();
		var dias = $('input[name="dias"]').val();
		var userid = $('input[name="userid"]').val();
		$.ajax({
			type: 'POST',
			url: global_data.url + '/comunidades-member_admin_submit.php',
			data: cgget('comid', true) + '&userid=' + userid + '&type=' + type + '&rango=' + rango + '&tiempo=' + tiempo + '&causa=' + causa + '&dias=' + dias,
			success: function(h){
				mydialog.procesando_fin();
				if(h.charAt(0) == 1) {
					mydialog.alert('Exito', h.substring(3), true);
				} else {
					mydialog.alert('Error', h.substring(3));
				}
			}
		});		
	},
	load_members: function(type) {
		if(type == 'miembros') {
			$('#miembros').addClass('active');
			$('#suspendidos').removeClass('active');
		} else if(type == 'suspendidos') {
			$('#miembros').removeClass('active');
			$('#suspendidos').addClass('active');
		}
		$('#com_members_result').css({'opacity' : 0.5});
		$.ajax({
			type: 'POST',
			url: global_data.url + '/comunidades-load_members.php',
			data: cgget('comid', true) + '&type=' + type,
			success: function(h){
				$('#com_members_result').html(h);
			}
		});
		$('#com_members_result').css({'opacity' : 1});
	},
	admin_rehabilitar: function(userid, gew) {
		if(!gew) {
			mydialog.show();
			mydialog.title('Rehabilitar usuario');
			mydialog.body('<div align="center">Si vas a reactivar al usuario antes de su habilitaci&oacute;n autom&aacute;tica<br />Explica tus razones.<br /><br /><input type="text" class="input_text" id="del_razon" maxlength="80" placeholder="Causa..." /></div>');
			mydialog.buttons(true, true, 'Aceptar', 'com.admin_rehabilitar(' + userid + ', true)', true, true, true, 'Cancelar', 'close', true, false);
			mydialog.center();
		} else {
			var razon = $('#del_razon').val();
			mydialog.procesando_inicio();
			$.ajax({
				type: 'POST',
				url: global_data.url + '/comunidades-member_reactivar.php',
				data:  'userid=' + userid + '&razon=' + razon + cgget('comid'),
				success: function(h){
					mydialog.procesando_fin();
					if(h.charAt(0) == 1) {
						mydialog.alert('&Eacute;xito', h.substring(3), true);
					} else {
						mydialog.alert('Error', h.substring(3));
					}
				}
			});
		}
	},
	search_member: function() {
		$('#com_members_result').css({'opacity' : 0.5});
		var like = $('#search_member').val();
		$.ajax({
			type: 'POST',
			url: global_data.url + '/comunidades-load_members.php',
			data: cgget('comid', true) + '&search=' + like,
			success: function(h){
				$('#com_members_result').html(h);
			}
		});
		$('#com_members_result').css({'opacity' : 1});
	},
	save_borrador: function() {
		if(com.required()) {
			var bid = $('input[name="bid"]').val();
			var cerrado = $('input[name="cerrado"]').is(':checked') ? '&cerrado=1' : '';
			var sticky = $('input[name="sticky"]').is(':checked') ? '&sticky=1' : '';			
			$('#loading').fadeIn(250);			
			$.ajax({
				type: 'POST',
				url: global_data.url + '/comunidades-save_borrador.php',
				data: cgget('comid', true) + '&bid=' + parseInt(bid) + '&titulo=' + encodeURIComponent($('input[name=titulo]').val()) + '&cuerpo=' + encodeURIComponent($('textarea[name=cuerpo]').val()) + cerrado + sticky,
				success: function(h){
					if(h.charAt(0) == 1) {
						var currentTime = new Date();
						$('input[name="bid"]').val(h.substring(3));
						$('#msj_borrador').html('Borrador guardado con &eacute;xito a las ' + currentTime.getHours() + ':' + currentTime.getMinutes() + ':' + currentTime.getSeconds() + ' hs.');
					} else {
						$('#msj_borrador').html(h.substring(3));
					}
				}
			});
			$('#loading').fadeOut(250);
		}
	}, 
	fav_filter: function(cat) {		
		$('.com_category').each(function(){
			if(cat == 'all') {
				$(this).show();
			} else {
				$(this).hide();
				$('.com_category.'+cat).show();
			}
        });
	},
	del_favorito: function(favid) {
		$('#loading').fadeIn(250);
		$.ajax({
			type: 'POST',
			url: global_data.url + '/comunidades-del_favorito.php',
			data: 'favid=' + favid,
			success: function(h){
				if(h.charAt(0) == 1) {
					$('#fav_tema_id_' + favid).fadeOut(100, function(){ 
						$(this).remove();
					});
				} else {
					mydialog.alert('Error', h.substring(3));
				}
			}
		});
		$('#loading').fadeOut(250);
	},
	borrador_filter: function(comid) {		
		$('.comid').each(function(){
			if(comid == 'all') {
				$(this).show();
			} else {
				$(this).hide();
				$('.comid.'+comid).show();
			}
        });
	},
	del_borrador: function(bid) {
		$('#loading').fadeIn(250);
		$.ajax({
			type: 'POST',
			url: global_data.url + '/comunidades-del_borrador.php',
			data: 'bid=' + bid,
			success: function(h){
				if(h.charAt(0) == 1) {
					$('#borrador_id_' + bid).fadeOut(100, function(){ 
						$(this).remove();
					});
				} else {
					mydialog.alert('Error', h.substring(3));
				}
			}
		});
		$('#loading').fadeOut(250);
	},
}
mySettings_resp = {
	nameSpace: 'markitcomment',
	resizeHandle: false,
	markupSet: [
		{name:lang['Negrita'], key:'B', openWith:'[b]', closeWith:'[/b]'},
		{name:lang['Cursiva'], key:'I', openWith:'[i]', closeWith:'[/i]'},
		{name:lang['Subrayado'], key:'U', openWith:'[u]', closeWith:'[/u]'},
		{name:lang['Insertar video de YouTube'], beforeInsert:function(h){ markit_yt(h); }},
		{name:lang['Insertar Imagen'], beforeInsert:function(h){ markit_img(h); }},
		{name:lang['Insertar Link'], beforeInsert:function(h){ markit_url(h); }},
		{name:"Insertar Emoticon", beforeInsert:function(h){ markit_emoticon(); }}
	]
};
function markit_emoticon() {
	$('#markit_emoticon').toggle('fast');
}
$(document).ready(function(){	
	$('#unfollow_com').mouseover(function() {
		$('#unfollow_comr').show();		
		$(this).hide();
	});	
	$('#unfollow_comr').mouseout(function() {
		if($('#follow_com').css('display') == 'none') {
			$('#unfollow_com').show();
			$(this).hide();
		}
	});
	$('#unfollow_tema').mouseover(function() {
		$('#unfollow_temar').show();		
		$(this).hide();
	});	
	$('#unfollow_temar').mouseout(function() {
		if($('#follow_tema').css('display') == 'none') {
			$('#unfollow_tema').show();
			$(this).hide();
		}
	});
	$('#com_change_hover').mouseover(function() {
		$('#com_change_list').show();
	}).mouseout(function() {
		$('#com_change_list').hide();
	});
	$('#com_change_list').mouseover(function() {
		$('#com_change_list').show();
	}).mouseout(function() {
		$('#com_change_list').hide();
	});
	// Si hay fondo en la comunidad lo actualizamos
	if(global_com.comid!='') {
		$('body').css({'background-image' : 'url("' + global_data.url + '/files/uploads/cf_' + global_com.comid + '.jpg")'});
	}
	//Editor de respuestas comunidades
	if($('#markit_resp') && !$('#markItUpbody_resp').length){
		$('#markit_resp').markItUp(mySettings_resp);
	}	
	console.log('Comunidades by Kmario19 - Re-Disenadas por MrDioamDev.');
  });