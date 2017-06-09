package org.mokylin.skin.app.beibao.jingmai
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_Select;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class StoneItem_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon:feathers.controls.UIAsset;

		public var lbJiacheng:feathers.controls.Label;

		public var lbName:feathers.controls.Label;

		public var rdo_select:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function StoneItem_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 36;
			this.width = 370;
			this.elementsContent = [Icon_i(),lbName_i(),lbJiacheng_i(),rdo_select_i(),__StoneItem_Skin_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon = temp;
			temp.name = "Icon";
			temp.styleName = "ui/app/beibao/jingmai/di_tubiao.png";
			temp.x = 1;
			temp.y = 1;
			return temp;
		}

		private function __StoneItem_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tips/xian2.png";
			temp.width = 369;
			temp.x = 0;
			temp.y = 34;
			return temp;
		}

		private function lbJiacheng_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJiacheng = temp;
			temp.name = "lbJiacheng";
			temp.text = "属性加成明细";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 184;
			temp.x = 177;
			temp.y = 9;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "砭石名称·1层 LV.3";
			temp.color = 0x9D4AA8;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 137;
			temp.x = 38;
			temp.y = 9;
			return temp;
		}

		private function rdo_select_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			rdo_select = temp;
			temp.name = "rdo_select";
			temp.height = 32;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_Select;
			temp.width = 366;
			temp.x = 2;
			temp.y = 2;
			return temp;
		}

	}
}