package org.mokylin.skin.mainui.tishi
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class caiji_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bar:feathers.controls.UIAsset;

		public var bar_bg:feathers.controls.UIAsset;

		public var lbl_progress:feathers.controls.Label;

		public var lbl_title:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function caiji_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 49;
			this.width = 257;
			this.elementsContent = [__caiji_Skin_UIAsset1_i(),__caiji_Skin_UIAsset2_i(),bar_bg_i(),bar_i(),lbl_progress_i(),lbl_title_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __caiji_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/tishi/jdt_di.png";
			temp.x = 1;
			temp.y = 19;
			return temp;
		}

		private function __caiji_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/tishi/jdt_tiao.png";
			temp.x = 1;
			temp.y = 19;
			return temp;
		}

		private function bar_bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bar_bg = temp;
			temp.name = "bar_bg";
			temp.styleName = "ui/mainui/tishi/jdt_kuang.png";
			temp.x = 0;
			temp.y = 19;
			return temp;
		}

		private function bar_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bar = temp;
			temp.name = "bar";
			temp.styleName = "ui/mainui/tishi/jdt_guang.png";
			temp.x = 247;
			temp.y = 13;
			return temp;
		}

		private function lbl_progress_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_progress = temp;
			temp.name = "lbl_progress";
			temp.text = "72%...";
			temp.textAlign = "center";
			temp.width = 64;
			temp.x = 106;
			temp.y = 24;
			return temp;
		}

		private function lbl_title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_title = temp;
			temp.name = "lbl_title";
			temp.fontSize = 16;
			temp.text = "采集中...";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 101;
			temp.y = 0;
			return temp;
		}

	}
}