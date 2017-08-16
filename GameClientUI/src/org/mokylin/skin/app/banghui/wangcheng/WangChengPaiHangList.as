package org.mokylin.skin.app.banghui.wangcheng
{
	import feathers.controls.text.Fontter;
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
	public class WangChengPaiHangList extends feathers.controls.StateSkin
	{
		public var List:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WangChengPaiHangList()
		{
			super();
			
			this.currentState = "normal";
			this.height = 247;
			this.width = 880;
			this.elementsContent = [__WangChengPaiHangList_UIAsset1_i(),__WangChengPaiHangList_UIAsset2_i(),__WangChengPaiHangList_UIAsset3_i(),__WangChengPaiHangList_UIAsset4_i(),__WangChengPaiHangList_UIAsset5_i(),__WangChengPaiHangList_UIAsset6_i(),__WangChengPaiHangList_Label1_i(),__WangChengPaiHangList_Label2_i(),__WangChengPaiHangList_Label3_i(),__WangChengPaiHangList_Label4_i(),__WangChengPaiHangList_Label5_i(),List_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function List_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			List = temp;
			temp.name = "List";
			temp.height = 220;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 878;
			temp.x = 1;
			temp.y = 26;
			return temp;
		}

		private function __WangChengPaiHangList_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "排名";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 29;
			temp.y = 6;
			return temp;
		}

		private function __WangChengPaiHangList_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "玩家名称";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 143;
			temp.y = 6;
			return temp;
		}

		private function __WangChengPaiHangList_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "职业";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 364;
			temp.y = 6;
			return temp;
		}

		private function __WangChengPaiHangList_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "击杀数";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 559;
			temp.y = 6;
			return temp;
		}

		private function __WangChengPaiHangList_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "个人总积分";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 733;
			temp.y = 6;
			return temp;
		}

		private function __WangChengPaiHangList_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 247;
			temp.styleName = "ui/common/background/neikuang_3.png";
			temp.width = 880;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __WangChengPaiHangList_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 86;
			temp.x = 2;
			temp.y = 2;
			return temp;
		}

		private function __WangChengPaiHangList_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 180;
			temp.x = 88;
			temp.y = 2;
			return temp;
		}

		private function __WangChengPaiHangList_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 219;
			temp.x = 268;
			temp.y = 2;
			return temp;
		}

		private function __WangChengPaiHangList_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 182;
			temp.x = 487;
			temp.y = 2;
			return temp;
		}

		private function __WangChengPaiHangList_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/component/tabbar/fenye/erjibiaoqian.png";
			temp.width = 209;
			temp.x = 669;
			temp.y = 2;
			return temp;
		}

	}
}