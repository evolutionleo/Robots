/// @description 
#region Setup the shader
shader_set(shOutline)
shader_set_uniform_f(upixelW,texelW)
shader_set_uniform_f(upixelH,texelH)
#endregion
#region Draw!
draw_self()
#endregion
#region Shader setup 2
shader_reset()
#endregion