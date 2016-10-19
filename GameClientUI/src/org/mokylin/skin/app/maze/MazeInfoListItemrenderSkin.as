package org.mokylin.skin.app.maze
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.app.maze.mc.UIMovieClipRank;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MazeInfoListItemrenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var country:feathers.controls.Label;

		public var name:feathers.controls.Label;

		public var rank:feathers.controls.Label;

		public var rankMc:feathers.controls.UIMovieClip;

		public var time:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MazeInfoListItemrenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 240;
			this.elementsContent = [bg_i(),rank_i(),name_i(),country_i(),time_i(),rankMc_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/common/liebiao/lie_biao-_di.png";
			temp.width = 240;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function country_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			country = temp;
			temp.name = "country";
			temp.text = "国家";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 160;
			temp.y = 5;
			return temp;
		}

		private function name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			name = temp;
			temp.name = "name";
			temp.text = "名字不超过七个字";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 118;
			temp.x = 38;
			temp.y = 5;
			return temp;
		}

		private function rankMc_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			rankMc = temp;
			temp.name = "rankMc";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.maze.mc.UIMovieClipRank);
			temp.x = 11;
			temp.y = 0;
			return temp;
		}

		private function rank_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			rank = temp;
			temp.name = "rank";
			temp.text = "排名";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 5;
			temp.y = 5;
			return temp;
		}

		private function time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			time = temp;
			temp.name = "time";
			temp.text = "19:30";
			temp.textAlign = "center";
			temp.color = 0x4EFD6F;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 40;
			temp.x = 197;
			temp.y = 5;
			return temp;
		}

	}
}