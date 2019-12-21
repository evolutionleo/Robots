/// @desc

var tilemap_id = layer_tilemap_get_id("Tile_layer")


width = room_width div CELL_WIDTH
height = room_height div CELL_HEIGHT

grid = ds_grid_create(width, height)
ds_grid_set_region(grid,0,0,width,height,0)

var controllerx = 0
var controllery = 0

repeat(height) {
	repeat(width) {
		if(place_empty(controllerx*CELL_WIDTH,controllery*CELL_HEIGHT,oWall)) {
			grid[# controllerx,controllery] = 1
		}
		controllerx++
	}
	controllery++
}