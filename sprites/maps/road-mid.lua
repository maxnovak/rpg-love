return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 30,
  height = 20,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 7,
  nextobjectid = 25,
  properties = {},
  tilesets = {
    {
      name = "grass",
      firstgid = 1,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 1,
      image = "mystic_woods_free_2.1/sprites/tilesets/grass.png",
      imagewidth = 16,
      imageheight = 16,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 1,
      tiles = {}
    },
    {
      name = "TilesetNature",
      firstgid = 2,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 24,
      image = "NinjaAdventure/Backgrounds/Tilesets/TilesetNature.png",
      imagewidth = 384,
      imageheight = 336,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 504,
      tiles = {}
    },
    {
      name = "objects",
      firstgid = 506,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 16,
      image = "mystic_woods_free_2.1/sprites/objects/objects.png",
      imagewidth = 256,
      imageheight = 208,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 208,
      tiles = {}
    },
    {
      name = "plains",
      firstgid = 714,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 6,
      image = "mystic_woods_free_2.1/sprites/tilesets/plains.png",
      imagewidth = 96,
      imageheight = 192,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 72,
      tiles = {}
    },
    {
      name = "TilesetVillageAbandoned",
      firstgid = 786,
      class = "",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 20,
      image = "NinjaAdventure/Backgrounds/Tilesets/TilesetVillageAbandoned.png",
      imagewidth = 320,
      imageheight = 192,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      wangsets = {},
      tilecount = 240,
      tiles = {}
    }
  },
  layers = {
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "Walls",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "Bush",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 160,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "Bush",
          type = "",
          shape = "rectangle",
          x = 208,
          y = 240,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "Bush",
          type = "",
          shape = "rectangle",
          x = 288,
          y = 80,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "Bush",
          type = "",
          shape = "rectangle",
          x = 368,
          y = 128,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "Bush",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 192,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "Trees Edge",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 176,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "Trees Edge",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 64,
          width = 16,
          height = 256,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "Trees Edge",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 0,
          width = 256,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "Trees Edge",
          type = "",
          shape = "rectangle",
          x = 464,
          y = 64,
          width = 16,
          height = 128,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "Cart",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 192,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "Logs",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 240,
          width = 32,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "House",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 224,
          width = 48,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "Trees Edge",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 304,
          width = 480,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "Interactable",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 7,
          name = "TownSign",
          type = "Sign",
          shape = "rectangle",
          x = 416,
          y = 224,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["actionText"] = "Village →"
          }
        },
        {
          id = 8,
          name = "Door",
          type = "Sign",
          shape = "rectangle",
          x = 32,
          y = 256,
          width = 16,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["actionText"] = "This place looks pretty beat up"
          }
        },
        {
          id = 21,
          name = "Road",
          type = "Exit",
          shape = "rectangle",
          x = 176,
          y = 0,
          width = 48,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["NextZoneY"] = "730"
          }
        },
        {
          id = 22,
          name = "Town",
          type = "Exit",
          shape = "rectangle",
          x = 464,
          y = 224,
          width = 16,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 1,
      name = "Tile Layer 1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 2,
      name = "Tile Layer 2",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        586, 587, 588, 0, 586, 587, 588, 0, 586, 587, 588, 721, 722, 723, 586, 587, 588, 0, 586, 587, 588, 0, 586, 587, 588, 0, 586, 587, 588, 0,
        602, 603, 604, 0, 602, 603, 604, 0, 602, 603, 604, 721, 722, 723, 602, 603, 604, 0, 602, 603, 604, 0, 602, 603, 604, 0, 602, 603, 604, 0,
        618, 619, 620, 0, 618, 619, 620, 0, 618, 619, 620, 721, 722, 723, 618, 619, 620, 0, 618, 619, 620, 0, 618, 619, 620, 0, 618, 619, 620, 0,
        634, 635, 636, 0, 634, 635, 636, 0, 634, 635, 636, 721, 722, 723, 634, 635, 636, 0, 634, 635, 636, 0, 634, 635, 636, 0, 634, 635, 636, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 972,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 992,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        586, 587, 588, 0, 586, 587, 588, 0, 586, 587, 588, 0, 0, 0, 586, 587, 588, 0, 586, 587, 588, 0, 586, 587, 588, 0, 586, 587, 588, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 3,
      name = "Tile Layer 3",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        588, 0, 586, 587, 588, 0, 586, 587, 588, 0, 0, 0, 0, 0, 0, 0, 586, 587, 588, 0, 586, 587, 588, 0, 586, 587, 588, 0, 586, 587,
        604, 0, 602, 603, 604, 0, 602, 603, 604, 0, 0, 0, 0, 0, 0, 0, 602, 603, 604, 0, 602, 603, 604, 0, 602, 603, 604, 0, 602, 603,
        620, 0, 618, 619, 620, 0, 618, 619, 620, 0, 0, 0, 0, 0, 0, 0, 618, 619, 620, 0, 618, 619, 620, 0, 618, 619, 620, 0, 618, 619,
        636, 0, 634, 635, 636, 0, 634, 635, 636, 0, 0, 0, 0, 0, 0, 0, 634, 635, 636, 0, 634, 635, 636, 0, 634, 635, 636, 0, 634, 635,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 721, 722, 723, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 721, 722, 723, 0, 0, 0, 0, 624, 625, 0, 0, 0, 0, 0, 0, 0, 0, 0, 586,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 721, 722, 723, 0, 0, 0, 0, 640, 641, 0, 0, 0, 0, 0, 0, 0, 0, 0, 602,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 721, 722, 723, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 618,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 721, 722, 723, 0, 0, 0, 0, 0, 0, 0, 0, 0, 624, 625, 0, 0, 0, 0, 634,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 721, 722, 723, 0, 0, 0, 0, 0, 0, 0, 0, 0, 640, 641, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 624, 625, 0, 0, 0, 0, 721, 722, 724, 716, 716, 716, 716, 716, 716, 716, 716, 716, 716, 717, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 640, 641, 0, 0, 0, 0, 721, 722, 722, 722, 722, 722, 722, 722, 722, 722, 722, 722, 722, 723, 0, 0, 0, 0, 0,
        0, 935, 936, 0, 0, 0, 0, 0, 0, 0, 0, 727, 728, 728, 728, 728, 728, 728, 728, 728, 728, 728, 719, 722, 723, 0, 0, 0, 624, 625,
        0, 955, 956, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 721, 722, 723, 0, 0, 0, 640, 641,
        0, 857, 858, 859, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 721, 722, 723, 0, 506, 0, 0, 0,
        0, 877, 878, 879, 937, 937, 0, 0, 0, 0, 0, 0, 0, 624, 625, 0, 0, 0, 0, 0, 0, 0, 721, 722, 724, 716, 716, 716, 716, 716,
        0, 897, 1022, 899, 957, 957, 0, 0, 0, 0, 0, 0, 0, 640, 641, 0, 0, 0, 0, 0, 0, 0, 721, 722, 722, 722, 722, 722, 722, 722,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 727, 728, 728, 728, 728, 728, 728, 728,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        588, 0, 586, 587, 588, 0, 586, 587, 588, 0, 0, 0, 586, 587, 588, 0, 586, 587, 588, 0, 586, 587, 588, 0, 586, 587, 588, 0, 586, 587
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 30,
      height = 20,
      id = 6,
      name = "Tile Layer 4",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        588, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        604, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        636, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        588, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        604, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 586,
        620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 602,
        636, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 618,
        588, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 634,
        604, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        636, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        588, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        604, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        620, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        636, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        588, 0, 0, 0, 0, 0, 0, 0, 0, 0, 586, 587, 588, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
