package org.mokylin.skin.app.beibao.zhangong
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.beibao.zhangong.button.ButtonWujiabaomuchang;
	import org.mokylin.skin.app.beibao.zhangong.uinumber.UINumberDengji;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MapItem_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnBG:feathers.controls.Radio;

		public var grp_dengji:feathers.controls.Group;

		public var lbMsg:feathers.controls.Label;

		public var numDengji:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MapItem_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 75;
			this.width = 221;
			this.elementsContent = [btnBG_i(),lbMsg_i(),grp_dengji_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MapItem_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/zhangong/yuan.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnBG_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			btnBG = temp;
			temp.name = "btnBG";
			temp.styleClass = org.mokylin.skin.app.beibao.zhangong.button.ButtonWujiabaomuchang;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grp_dengji_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_dengji = temp;
			temp.name = "grp_dengji";
			temp.x = 189;
			temp.y = 8;
			temp.elementsContent = [__MapItem_Skin_UIAsset1_i(),numDengji_i()];
			return temp;
		}

		private function lbMsg_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMsg = temp;
			temp.name = "lbMsg";
			temp.letterSpacing = 1;
			temp.text = "23%";
			temp.color = 0x5CB006;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 109;
			temp.x = 9;
			temp.y = 52;
			return temp;
		}

		private function numDengji_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numDengji = temp;
			temp.name = "numDengji";
			temp.height = 20;
			temp.label = "6";
			temp.styleClass = org.mokylin.skin.app.beibao.zhangong.uinumber.UINumberDengji;
			temp.width = 22;
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

	}
}