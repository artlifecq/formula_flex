package org.mokylin.skin.app.taskDiailog
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TaskDiailogBtnListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var imgIco:feathers.controls.UIAsset;

		public var labInfo:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TaskDiailogBtnListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 26;
			this.width = 253;
			this.elementsContent = [bg_i(),imgIco_i(),labInfo_i()];
			
			states = {
				init:[
						{target:"labInfo",
							name:"paddingLeft",
							value:5
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 26;
			temp.touchGroup = true;
			temp.touchable = true;
			temp.styleName = "ui/app/npc/select_bg.png";
			temp.width = 253;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgIco_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgIco = temp;
			temp.name = "imgIco";
			temp.height = 19;
			temp.styleName = "ui/common/icon/ys/yss.png";
			temp.width = 19;
			temp.x = 4;
			temp.y = 3;
			return temp;
		}

		private function labInfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labInfo = temp;
			temp.name = "labInfo";
			temp.height = 26;
			temp.touchGroup = true;
			temp.touchable = true;
			temp.fontSize = 14;
			temp.text = "标签";
			temp.textAlign = "left";
			temp.color = 0xF09E01;
			temp.width = 225;
			temp.x = 28;
			temp.y = 0;
			return temp;
		}

	}
}