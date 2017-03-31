// Monochrome (Greyscale) version of the gb-leisure carto map style.

// https://github.com/gregrs-uk/gb-leisure-carto/


@residential: #f0f0f0;
@water: #d0d0d0;
@water_outline: #a0a0a0;
@wood: #e0e0e0;
@building: #707070;

@road_casing_colour: #000000;
@motorway_width: 4;
@motorway_colour:#a0a0a0;
@primary_width: 3;
@primary_colour:#c0c0c0;
@secondary_width: 3;
@secondary_colour:#e0e0e0;
@minor_width: 2;
@outer_width: 1;

@path_colour:#202020;

@contour_colour: #303030;
@contour_width:1;
@grid_colour: #101010;
@grid_width:1;
@boundary_colour:#a0a0a0;

Map {
  background-color: white;
}

#landuse {
  [natural='woodland'], 
  [natural='wood'],
  [landuse='forest'] {
    polygon-fill: @wood;
    polygon-pattern-file: url('icons/Trees.png');
  }
  [natural='scrub'] {
    polygon-fill: @wood;
    polygon-pattern-file: url('icons/Scrub.png');
  }
  [landuse='residential'], [landuse='industrial'],
  [landuse='retail'], [landuse='commercial'],
  [landuse='farmyard'] {
    polygon-fill: @residential;
    line-color: @boundary_colour;
    line-width: 0.5;
  }
}

#water {
  // natural=water and waterway=riverbank
  polygon-fill: @water;
  polygon-pattern-file: url('icons/Water.png');
  line-width:1;
  line-color: @water_outline;
}

#waterways {
  [waterway='stream'],[waterway='drain'],[waterway='ditch'] {
    line-width:1;
    line-color: @water;
  }
  [waterway='river'],[waterway='canal'] {
    ::outer {
      line-width:4;
      line-color: @water;
      line-cap:round;
      line-join:bevel;
    }
    ::inner {
      line-width:2;
      line-color: @water;
      line-cap:round;
      line-join:bevel;
    }
  }
}


#roads {
  ::outer {
    line-cap:round;
    line-join:bevel;
    line-color: @road_casing_colour;
    [highway='motorway'],[highway='motorway_link'] {
      line-width:@motorway_width+@outer_width;
    }
    [highway='trunk'],[highway='trunk_link'],
    [highway='primary'],[highway='primary_link'] {
      line-width:@primary_width+@outer_width;
    }
    [highway='secondary'],[highway='secondary_link'] {
      line-width:@secondary_width+@outer_width;
    }
    [highway='tertiary'],[highway='tertiary_link'] {
      line-width:@secondary_width+@outer_width;
    }
    [highway='unclassified'],[highway='residential'] {
      line-width:@minor_width+@outer_width;
    }
    [highway='service'],
    [highway='track'][tracktype='grade1'],
    [highway='track'][tracktype='grade2'] {
      line-width:@minor_width+@outer_width;
    }
    [highway='track'][tracktype!='grade1'][tracktype!='grade2'] {
      line-width:@minor_width+@outer_width;
      line-dasharray:6,2;
      line-cap:butt;
    }
  }

  ::inner {
    line-cap:round;
    line-join:bevel;
    line-color:white;
    [highway='motorway'],[highway='motorway_link'] {
      line-width:@motorway_width;
      line-color:@motorway_colour;
    }
    [highway='trunk'],[highway='trunk_link'],
    [highway='primary'],[highway='primary_link'] {
      line-width:@primary_width;
      line-color:@primary_colour;
    }
    [highway='secondary'],[highway='secondary_link'] {
      line-width:@secondary_width;
      line-color:@secondary_colour;
    }
    [highway='tertiary'],[highway='tertiary_link'] {
      line-width:@secondary_width;
      line-color:@secondary_colour;
    }
    [highway='unclassified'],[highway='residential'],
    [highway='service'],[highway='track'] {
      line-width:@minor_width;
    }
  }
}

#railway {
  line-width:1;
  line-color:black;
  line-cap:butt;
  line-join:bevel;
}

#buildings {
  polygon-fill:@building;
}

#paths {
  // from db: highway=footway/bridleway/cycleway
  // or anything with designation tag set
  line-width: 1.5;
  line-color:@path_colour;
  line-dasharray:4,2;
  line-cap:butt;
  line-join:bevel;


  // probably public rights of way but no designation set
  [foot='designated'],[access='designated'],
  [foot='permissive'],[access='permissive'],
  [foot='yes'],[access='yes'],[designation='public_footpath'],[highway='footway'] {
    line-dasharray:4,2;
  }
  [designation='public_bridleway'],[highway='bridleway'],[highway='cycleway'] {
    line-dasharray:8,2;
  }
  [designation='restricted_byway'] {
    line-color: @path_colour;
  }
  [designation='byway_open_to_all_traffic'] {
    line-color: @path_colour;
  }
  [bridge='yes'] {
		   //line-color: blue;
		   text-face-name:'Liberation Sans Regular';
  		   text-size:8pt;
    		   text-dy: -3;
		   text-dx: 3;
		   text-name:"'FB'";
		 }
  [highway='steps'] {
     ::line {
       line-width: 3;
       line-color: black;
     }
     ::dash {
       line-color:white;
       line-width:2;
       line-dasharray: 2,1;
     }
  }
}

#boundaries {
  text-face-name:'Liberation Sans Regular';
  text-size:8pt;
  text-dy: -3;
  text-dx: 3;
  text-name:"''";
  [barrier='fence'] {
  		    line-color:@boundary_colour;
  		    line-width:0.5;
		    }  		    
  [barrier='hedge'] {
  		    line-color:@boundary_colour;
		    line-width:1;
		    }
  [barrier='wall'] {
  		   line-color:@boundary_colour;
		   line-width:1;
		   }
  //[barrier='gate'],[barrier='kissing gate'] { text-name:"'Gate'"; }
  //[barrier='stile'] { text-name:"'Stile'"; }
}

#barriers {
  text-face-name:'Liberation Sans Regular';
  text-size:8pt;
  text-dy: -3;
  text-dx: 3;
  text-name:"''";
  [barrier='gate'],[barrier='kissing gate'] {
  				     //text-name:"'Gate'";
				     point-file:url('icons/Gate.png');
				     }
  [barrier='stile'] { //text-name:"'Stile'";
  		    point-file:url('icons/Stile.png');}
}

#contours {
  line-width:@contour_width;
  line-color:@contour_colour;
  line-opacity:0.6;
  line-cap:butt;
  line-dasharray:1,3;
}

#labels {
  text-name:[name];
  text-face-name:'Liberation Sans Regular';
  text-halo-fill: white; //fadeout(white,40%);
  text-size:8pt;
  text-halo-radius:1.5;
  text-fill: black; //#777;
  text-opacity:0.3;
  [place='city'] {
    text-size:35pt;
  }
  [place='town'] {
    text-size:28pt;
  }
  [place='suburb'],[place='neighbourhood']
  {
    text-size:21pt;
  }
  [place='village'],[place='hamlet'],
  [place='island'] {
    text-size:14pt;
  }
  [amenity='school'] {
    text-name:"'Sch'"
  }
  [amenity='place_of_worship'][religion='christian'] {
    text-name:"'Ch'"
  }
  [amenity='pub'] {
    text-name:"'PH'"
  }
  [landuse='farmyard'], [place='farm'] {
    text-dy: -13;
  }
}

#grid {
  line-color:@grid_colour;
  line-width:@grid_width;
  line-opacity:0.25;
}
