import { Component } from '@angular/core';
import { FieldArrayType } from '@ngx-formly/core';

@Component({
  selector: 'formly-array-type',
  template: `
  <section>
    <section class="add-item-section">
      <button mat-raised-button color="accent" (click)="add()" type="button">
        {{ to.label }} <mat-icon>add</mat-icon>
      </button>
    </section>
    <mat-expansion-panel *ngFor="let field of field.fieldGroup;let i = index;" class="row item-expansion-panel"
      hideToggle>
      <mat-expansion-panel-header>
        <mat-panel-title *ngIf="to.label">
          <section>
            {{ to.label }} [{{i}}]
            <button mat-icon-button color="warn" (click)="remove(i)" type="button">
              <mat-icon>delete</mat-icon>
            </button>
          </section>
        </mat-panel-title>
      </mat-expansion-panel-header>
      <formly-field class="col-10" [field]="field"></formly-field>
    </mat-expansion-panel>
</section>`,
})
export class ArrayTypeComponent extends FieldArrayType { }

// <div class="alert alert-danger" role="alert" *ngIf="showError && formControl.errors">
//       <formly-validation-message [field]="field"></formly-validation-message>
//     </div>