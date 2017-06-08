package org.mokylin.skin.app.zhanchang.dianfengduijue
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class DuanWeiList_Head extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var uiIcon:feathers.controls.UIAsset;

		public var uiName:feathers.controls.UIAsset;

		public var uiNomal:feathers.controls.UIAsset;

		public var uiSelect:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DuanWeiList_Head()
		{
			super();
			
			this.currentState = "normal";
			this.height = 72;
			this.width = 85;
			this.elementsContent = [uiNomal_i(),uiSelect_i(),uiIcon_i(),uiName_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function uiIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiIcon = temp;
			temp.name = "uiIcon";
			temp.styleName = "ui/app/zhanchang/icon/huangjinyijie_xiao.png";
			temp.x = 8;
			temp.y = 0;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/app/zhanchang/dianfengduijue/name/1.png";
			temp.x = 13;
			temp.y = 46;
			return temp;
		}

		private function uiNomal_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiNomal = temp;
			temp.name = "uiNomal";
			temp.styleName = "ui/app/zhanchang/dianfengduijue/di/up.png";
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

		private function uiSelect_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiSelect = temp;
			temp.name = "uiSelect";
			temp.styleName = "ui/app/zhanchang/dianfengduijue/di/over.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 1;
			return temp;
		}

	}
}