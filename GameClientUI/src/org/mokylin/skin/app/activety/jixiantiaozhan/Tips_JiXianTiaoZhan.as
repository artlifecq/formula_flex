package org.mokylin.skin.app.activety.jixiantiaozhan
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Tips_JiXianTiaoZhan extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var icon:feathers.controls.UIAsset;

		public var lbName:feathers.controls.Label;

		public var lbT1:feathers.controls.Label;

		public var lbT2:feathers.controls.Label;

		public var lbT3:feathers.controls.Label;

		public var line1:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_JiXianTiaoZhan()
		{
			super();
			
			this.currentState = "normal";
			this.width = 280;
			this.elementsContent = [bg_i(),lbT1_i(),lbT2_i(),lbT3_i(),__Tips_JiXianTiaoZhan_Label3_i(),icon_i(),lbName_i(),line1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Tips_JiXianTiaoZhan_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.leading = 1;
			temp.letterSpacing = 0;
			temp.text = "【提示】";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 65;
			temp.x = 5;
			temp.y = 105;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 166;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 280;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 11;
			temp.y = 11;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.fontSize = 16;
			temp.text = "青龙之力";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 143;
			temp.x = 90;
			temp.y = 11;
			return temp;
		}

		private function lbT1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbT1 = temp;
			temp.name = "lbT1";
			temp.text = "效果增强：$";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 170;
			temp.x = 90;
			temp.y = 34;
			return temp;
		}

		private function lbT2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbT2 = temp;
			temp.name = "lbT2";
			temp.text = "当前层数：$";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 170;
			temp.x = 90;
			temp.y = 55;
			return temp;
		}

		private function lbT3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbT3 = temp;
			temp.name = "lbT3";
			temp.height = 42;
			temp.leading = 1;
			temp.letterSpacing = 0;
			temp.text = "离开地图后，BUFF效果立即消失，仅在本次活动期间的活动地图生效。";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 256;
			temp.x = 11;
			temp.y = 123;
			return temp;
		}

		private function line1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line1 = temp;
			temp.name = "line1";
			temp.styleName = "ui/common/tips/xian.png";
			temp.x = 7;
			temp.y = 92;
			return temp;
		}

	}
}