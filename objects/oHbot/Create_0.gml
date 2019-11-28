/// @description 
#region Setup the shader
upixelH = shader_get_uniform(shOutline,"pixelH")
upixelW = shader_get_uniform(shOutline,"pixelW")
texelW = texture_get_texel_width(sprite_get_texture(sprite_index,0))
texelH = texture_get_texel_height(sprite_get_texture(sprite_index,0))
#endregion