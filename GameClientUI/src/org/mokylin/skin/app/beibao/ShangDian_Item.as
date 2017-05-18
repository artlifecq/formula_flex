package org.mokylin.skin.app.beibao
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.beibao.button.ItemBtnSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShangDian_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon:feathers.controls.UIAsset;

		public var btnOver:feathers.controls.Button;

		public var imgPrice:feathers.controls.UIAsset;

		public var lbName:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShangDian_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 59;
			this.width = 162;
			this.elementsContent = [__ShangDian_Item_UIAsset1_i(),btnOver_i(),Icon_i(),lbName_i(),imgPrice_i(),lbNum_i()];
			
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
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 2;
			temp.y = 2;
			return temp;
		}

		private function __ShangDian_Item_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/shangdian/dikuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnOver_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOver = temp;
			temp.name = "btnOver";
			temp.height = 59;
			temp.styleClass = org.mokylin.skin.app.beibao.button.ItemBtnSkin;
			temp.width = 162;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgPrice_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgPrice = temp;
			temp.name = "imgPrice";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/tubiao/yuanbao_24.png";
			temp.x = 59;
			temp.y = 31;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.text = "一级补心丹";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 90;
			temp.x = 65;
			temp.y = 9;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.text = "x100";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 73;
			temp.x = 85;
			temp.y = 34;
			return temp;
		}

	}
}