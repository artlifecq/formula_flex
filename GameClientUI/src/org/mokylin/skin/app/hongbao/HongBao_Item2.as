package org.mokylin.skin.app.hongbao
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.hongbao.HongBao_ItemBg;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HongBao_Item2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var lbName:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;

		public var uiNo1:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HongBao_Item2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 29;
			this.elementsContent = [bg_i(),lbName_i(),lbNum_i(),uiNo1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 29;
			var skin:StateSkin = new org.mokylin.skin.app.hongbao.HongBao_ItemBg()
			temp.skin = skin
			temp.width = 263;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbName = temp;
			temp.name = "lbName";
			temp.text = "超级无敌xxxx";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 119;
			temp.x = 76;
			temp.y = 5;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.text = "20礼金";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 64;
			temp.x = 195;
			temp.y = 5;
			return temp;
		}

		private function uiNo1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiNo1 = temp;
			temp.name = "uiNo1";
			temp.styleName = "ui/app/hongbao/shouqiwang.png";
			temp.x = 12;
			temp.y = 3;
			return temp;
		}

	}
}