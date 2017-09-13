package org.mokylin.skin.app.fulidating
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
	public class FLDT_Dengjilibao extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var banner:feathers.controls.UIAsset;

		public var listCont:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FLDT_Dengjilibao()
		{
			super();
			
			this.currentState = "normal";
			this.width = 749;
			this.elementsContent = [banner_i(),listCont_i()];
			
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
			temp.styleName = "ui/big_bg/fulidating/dengjidali.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function listCont_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			listCont = temp;
			temp.name = "listCont";
			temp.height = 382;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 745;
			temp.x = 0;
			temp.y = 118;
			return temp;
		}

	}
}