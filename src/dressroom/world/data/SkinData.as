package dressroom.world.data
{
	import dressroom.data.*;
	import flash.display.*;
	import flash.geom.*;

	public class SkinData extends ItemData
	{
		// Storage
		private var _assetID : String;
		
		// pData = { id:String, ?type:String, ?color:int, ?assetID:String }
		public function SkinData(pData:Object) {
			super({ id:pData.id, type:pData.type == null ? ITEM.SKIN : pData.type });
			_assetID = pData.assetID != null ? pData.assetID : id;
			if(pData.color) {
				defaultColors = [ pData.color ];
				setColorsToDefault();
			}
			
			classMap = {};

			// Face
			classMap.Tete_1			= Main.assets.getLoadedClass( "_Tete_1_"+_assetID+"_1" );
			// Eyes
			classMap.Oeil_1			= Main.assets.getLoadedClass( "_Oeil_1_"+_assetID+"_1" );
			// Body
			classMap.Corps_1		= Main.assets.getLoadedClass( "_Corps_1_"+_assetID+"_1" );
			// Wings
			classMap.Ailes_1		= Main.assets.getLoadedClass( "_Ailes_1_"+_assetID+"_1" );
			// Tail
			classMap.Queue_1		= Main.assets.getLoadedClass( "_Queue_1_"+_assetID+"_1" );
			// Tail Ornament
			classMap.Boule_1		= Main.assets.getLoadedClass( "_Boule_1_"+_assetID+"_1" );

			// Back Paws
			classMap.PiedG_1		= Main.assets.getLoadedClass( "_PiedG_1_"+_assetID+"_1" );
			classMap.PiedD_1		= Main.assets.getLoadedClass( "_PiedD_1_"+_assetID+"_1" );
			// Front Paws
			classMap.PatteG_1		= Main.assets.getLoadedClass( "_PatteG_1_"+_assetID+"_1" );
			classMap.PatteD_1		= Main.assets.getLoadedClass( "_PatteD_1_"+_assetID+"_1" );
			// Ears
			classMap.OreilleG_1		= Main.assets.getLoadedClass( "_OreilleG_1_"+_assetID+"_1" );
			classMap.OreilleD_1		= Main.assets.getLoadedClass( "_OreilleD_1_"+_assetID+"_1" );
			// Legs
			classMap.CuisseG_1		= Main.assets.getLoadedClass( "_CuisseG_1_"+_assetID+"_1" );
			classMap.CuisseD_1		= Main.assets.getLoadedClass( "_CuisseD_1_"+_assetID+"_1" );
		}

		protected override function _initDefaultColors() : void {

		}
		
		// pOptions = { shamanMode:int(SHAMAN_MODE) }
		public override function getPart(pID:String, pOptions:Object=null) : Class {
			var shamanMode = Main.costumes.shamanMode;
			if(pOptions != null) {
				if(pOptions.shamanMode) { shamanMode = pOptions.shamanMode; }
			}
			if(shamanMode == SHAMAN_MODE.DIVINE) {
				shamanMode--; // saves each piece having to decrement one recursevly.
			}
			var tClass = Main.assets.getLoadedClass( "_"+pID+"_"+_assetID+"_"+shamanMode );
			return tClass == null && shamanMode > SHAMAN_MODE.NORMAL ? getPart(pID, { shamanMode:shamanMode-1 }) : tClass;
		}
	}
}
