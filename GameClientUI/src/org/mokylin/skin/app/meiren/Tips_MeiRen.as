package org.mokylin.skin.app.meiren
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
	public class Tips_MeiRen extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var lb_type:feathers.controls.Label;

		public var lbl_gongj1:feathers.controls.Label;

		public var uiLevel:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_MeiRen()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),lb_type_i(),lbl_gongj1_i(),uiName_i(),uiLevel_i()];
			
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
			temp.height = 112;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 280;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lb_type_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_type = temp;
			temp.name = "lb_type";
			temp.text = "攻  击：";
			temp.color = 0xA3A594;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 20;
			temp.y = 57;
			return temp;
		}

		private function lbl_gongj1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_gongj1 = temp;
			temp.name = "lbl_gongj1";
			temp.text = "100";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 76;
			temp.x = 83;
			temp.y = 57;
			return temp;
		}

		private function uiLevel_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLevel = temp;
			temp.name = "uiLevel";
			temp.styleName = "ui/app/meiren/jieshu/12.png";
			temp.x = 244;
			temp.y = 9;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/meiren/head_icon/name2s.png";
			temp.x = 19;
			temp.y = 19;
			return temp;
		}

	}
}