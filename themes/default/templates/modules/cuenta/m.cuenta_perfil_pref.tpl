<a class="botonCuenta" onclick="cuenta.chgsec(this)">Intereses y preferencias</a>
<fieldset style="display: none">
	<label for="mis_intereses">Mis intereses</label>
	<textarea class="cuenta-save-5 form-control" name="intereses" id="mis_intereses">{$tsPerfil.p_intereses}</textarea></p>
	<label for="hobbies">Hobbies</label>
	<textarea class="cuenta-save-5 form-control" name="hobbies" id="hobbies">{$tsPerfil.p_hobbies}</textarea></p>
	<label for="series_tv_favoritas">Series de TV favoritas:</label>
	<textarea class="cuenta-save-5 form-control" name="tv" id="series_tv_favoritas">{$tsPerfil.p_tv}</textarea></p>
	<label for="musica_favorita">Música favorita</label>
	<textarea class="cuenta-save-5 form-control" name="musica" id="musica_favorita">{$tsPerfil.p_musica}</textarea></p>
	<label for="deportes_y_equipos_favoritos">Deportes y equipos favoritos</label>
	<textarea class="cuenta-save-5 form-control" name="deportes" id="deportes_y_equipos_favoritos">{$tsPerfil.p_deportes}</textarea></p>
	<label for="libros_favoritos">Libros favoritos</label>
	<textarea class="cuenta-save-5 form-control" name="libros" id="libros_favoritos">{$tsPerfil.p_libros}</textarea></p>
	<label for="peliculas_favoritas">Películas favoritas</label>
	<textarea class="cuenta-save-5 form-control" name="peliculas" id="peliculas_favoritas">{$tsPerfil.p_peliculas}</textarea></p>
	<label for="comida_favorita">Comida favorita</label>
	<textarea class="cuenta-save-5 form-control" name="comida" id="comida_favorita">{$tsPerfil.p_comida}</textarea></p>
	<label for="mis_heroes_son">Mis héroes son</label>
	<textarea class="cuenta-save-5 form-control" name="heroes" id="mis_heroes_son">{$tsPerfil.p_heroes}</textarea></p>
	<input type="button" value="Guardar" onclick="cuenta.save(5)" class="boton btn btn-block btn-success btn-flat">
</fieldset>