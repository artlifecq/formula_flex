package org.mokylin.skin.app.country.guild
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import org.mokylin.skin.common.version_3.Q_qihao.mc.UIMovieClipFlag_biankuang;
	import org.mokylin.skin.common.version_3.Q_qihao.mc.UIMovieClipFlag_diwen;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class GuildFlagCompleteSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var banner:feathers.controls.Label;

		public var dikuang:feathers.controls.UIMovieClip;

		public var diwen:feathers.controls.UIMovieClip;

		public var level:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuildFlagCompleteSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__GuildFlagCompleteSkin_UIAsset1_i(),dikuang_i(),diwen_i(),banner_i(),level_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __GuildFlagCompleteSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/Q_qihao/di.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function banner_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			banner = temp;
			temp.name = "banner";
			temp.height = 28;
			temp.fontSize = 22;
			temp.text = "b";
			temp.textAlign = "center";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 27;
			temp.x = 37;
			temp.y = 28;
			return temp;
		}

		private function dikuang_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			dikuang = temp;
			temp.name = "dikuang";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.common.version_3.Q_qihao.mc.UIMovieClipFlag_biankuang);
			temp.x = 31;
			temp.y = 21;
			return temp;
		}

		private function diwen_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			diwen = temp;
			temp.name = "diwen";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.common.version_3.Q_qihao.mc.UIMovieClipFlag_diwen);
			temp.x = 31;
			temp.y = 21;
			return temp;
		}

		private function level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			level = temp;
			temp.name = "level";
			temp.text = "6级";
			temp.textAlign = "center";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 30;
			temp.x = 37;
			temp.y = 64;
			return temp;
		}

	}
}