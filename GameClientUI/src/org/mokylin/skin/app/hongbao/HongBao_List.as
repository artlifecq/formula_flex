package org.mokylin.skin.app.hongbao
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
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
	public class HongBao_List extends feathers.controls.StateSkin
	{
		public var ListItem:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HongBao_List()
		{
			super();
			
			this.currentState = "normal";
			this.height = 473;
			this.width = 642;
			this.elementsContent = [__HongBao_List_Group1_i(),ListItem_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function ListItem_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			ListItem = temp;
			temp.name = "ListItem";
			temp.height = 401;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 636;
			temp.x = 3;
			temp.y = 29;
			return temp;
		}

		private function __HongBao_List_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 3;
			temp.y = 3;
			temp.elementsContent = [__HongBao_List_UIAsset2_i(),__HongBao_List_UIAsset3_i(),__HongBao_List_UIAsset4_i(),__HongBao_List_Label1_i(),__HongBao_List_Label2_i(),__HongBao_List_Label3_i()];
			return temp;
		}

		private function __HongBao_List_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "土豪";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 98;
			temp.y = 4;
			return temp;
		}

		private function __HongBao_List_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "红包类型";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 287;
			temp.y = 4;
			return temp;
		}

		private function __HongBao_List_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "红包操作";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 483;
			temp.y = 4;
			return temp;
		}

		private function __HongBao_List_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 227;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __HongBao_List_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 179;
			temp.x = 227;
			temp.y = 0;
			return temp;
		}

		private function __HongBao_List_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 230;
			temp.x = 406;
			temp.y = 0;
			return temp;
		}

	}
}