package org.mokylin.skin.app.tequan
{
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TQ_Meirilibao extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var banner:feathers.controls.UIAsset;

		public var listCont:feathers.controls.List;

		public var uibg:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TQ_Meirilibao()
		{
			super();
			
			this.currentState = "normal";
			this.width = 706;
			this.elementsContent = [uibg_i(),banner_i(),listCont_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function banner_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			banner = temp;
			temp.name = "banner";
			temp.styleName = "ui/big_bg/tequan/banner_meirilibao.jpg";
			temp.x = 3;
			temp.y = 3;
			return temp;
		}

		private function listCont_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listCont = temp;
			temp.name = "listCont";
			temp.height = 368;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 704;
			temp.x = 3;
			temp.y = 134;
			return temp;
		}

		private function uibg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uibg = temp;
			temp.name = "uibg";
			temp.height = 504;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 712;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}