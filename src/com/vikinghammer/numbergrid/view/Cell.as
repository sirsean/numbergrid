package com.vikinghammer.numbergrid.view
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.controls.LinkButton;

	/**
	 * A cell for the number grid.
	 * Each cell contains a number, and can either be selected or not.
	 * When it's selected, it changes color.
	 */
	public class Cell extends LinkButton
	{
		private var _number:Number;
		private var _selected:Boolean;
		
		/**
		 * Create a new cell.
		 * Set its initial number, if it's given.
		 * It's a toggle-able button, so set toggle to true.
		 * Finally, set up the event listener so we can control what to do
		 * when the cell is clicked.
		 */
		public function Cell(number:Number=1)
		{
			super();
			
			this.number = number;
			
			this.toggle = true;
			
			this.setStyle("fontSize", 14);
			this.width = 50;
			
			this.addEventListener(MouseEvent.CLICK, _clickHandler);
		}
		
		/**
		 * Set whether this cell is selected.
		 * 
		 * And then, if it is, change its style so it looks like it's
		 * selected.
		 */
		public override function set selected(value:Boolean):void {
			super.selected = value;
			
			_selected = value;
			
			if (this.selected) {
				this.setStyle("color", "red");
				this.setStyle("textRollOverColor", "red");
			} else {
				this.setStyle("color", "black");
				this.setStyle("textRollOverColor", "black");
			}
		}
		
		/**
		 * Get whether this cell is selected.
		 */
		public override function get selected():Boolean {
			return _selected;
		}
		
		/**
		 * Set the current number of this cell.
		 */
		public function set number(value:Number):void {
			_number = value;
			
			this.label = String(number);
		}
		
		/**
		 * Get the current number of this cell.
		 */
		public function get number():Number {
			return _number;
		}
		
		/**
		 * When they click the cell, we toggle whether it's selected
		 * or not.
		 */
		private function _clickHandler(event:Event):void {
			this.selected = !this.selected;
		}
		
	}
}