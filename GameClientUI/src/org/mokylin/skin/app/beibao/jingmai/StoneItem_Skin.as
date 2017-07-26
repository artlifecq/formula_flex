package org.mokylin.skin.app.beibao.jingmai
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSelect_Skin;

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

		public var bg:feathers.controls.UIAsset;

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
			this.height = 53;
			this.width = 282;
			this.elementsContent = [bg_i(),Icon_i(),lbName_i(),lbJiacheng_i(),rdo_select_i()];
			
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
			temp.styleName = "ui/app/beibao/icons/bianshi/hong/baoji.png";
			temp.x = 14;
			temp.y = 8;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 53;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 282;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbJiacheng_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbJiacheng = temp;
			temp.name = "lbJiacheng";
			temp.htmlText = "暴击:<font color='#ffea00'>+0.60%</font>";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 108;
			temp.x = 169;
			temp.y = 18;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "5级暴击砭石";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 130;
			temp.x = 50;
			temp.y = 18;
			return temp;
		}

		private function rdo_select_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			rdo_select = temp;
			temp.name = "rdo_select";
			temp.height = 53;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSelect_Skin;
			temp.width = 282;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}