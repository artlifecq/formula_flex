package org.mokylin.skin.app.zhanchang.dianfengduijue
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber4;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class DuanWeiList_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var icon1:feathers.controls.UIAsset;

		public var numJifen:feathers.controls.UINumber;

		public var uiName:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DuanWeiList_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 66;
			this.width = 468;
			this.elementsContent = [__DuanWeiList_Item_UIAsset1_i(),uiName_i(),numJifen_i(),icon1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __DuanWeiList_Item_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/dianfengduijue/tiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 145;
			temp.y = 12;
			return temp;
		}

		private function numJifen_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numJifen = temp;
			temp.name = "numJifen";
			temp.gap = -5;
			temp.height = 25;
			temp.label = "1168";
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber4;
			temp.width = 87;
			temp.x = 378;
			temp.y = 22;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/zhanchang/icon/name/1001.png";
			temp.x = 16;
			temp.y = 21;
			return temp;
		}

	}
}