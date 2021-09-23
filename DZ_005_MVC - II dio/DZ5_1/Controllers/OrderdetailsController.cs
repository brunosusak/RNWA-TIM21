using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using DZ5_1.Models;

namespace DZ5_1.Controllers
{
    public class OrderdetailsController : Controller
    {
        private readonly clinicContext _context;

        public OrderdetailsController(clinicContext context)
        {
            _context = context;
        }

        // GET: Orderdetails
        public async Task<IActionResult> Index()
        {
            var clinicContext = _context.Orderdetails.Include(o => o.OrderNumberNavigation).Include(o => o.ProductCodeNavigation);
            return View(await clinicContext.ToListAsync());
        }

        // GET: Orderdetails/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var orderdetail = await _context.Orderdetails
                .Include(o => o.OrderNumberNavigation)
                .Include(o => o.ProductCodeNavigation)
                .FirstOrDefaultAsync(m => m.OrderNumber == id);
            if (orderdetail == null)
            {
                return NotFound();
            }

            return View(orderdetail);
        }

        // GET: Orderdetails/Create
        public IActionResult Create()
        {
            ViewData["OrderNumber"] = new SelectList(_context.Orders, "OrderNumber", "Status");
            ViewData["ProductCode"] = new SelectList(_context.Products, "ProductCode", "ProductCode");
            return View();
        }

        // POST: Orderdetails/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("OrderNumber,ProductCode,QuantityOrdered,PriceEach,OrderLineNumber")] Orderdetail orderdetail)
        {
            if (ModelState.IsValid)
            {
                _context.Add(orderdetail);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["OrderNumber"] = new SelectList(_context.Orders, "OrderNumber", "Status", orderdetail.OrderNumber);
            ViewData["ProductCode"] = new SelectList(_context.Products, "ProductCode", "ProductCode", orderdetail.ProductCode);
            return View(orderdetail);
        }

        // GET: Orderdetails/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var orderdetail = await _context.Orderdetails.FindAsync(id);
            if (orderdetail == null)
            {
                return NotFound();
            }
            ViewData["OrderNumber"] = new SelectList(_context.Orders, "OrderNumber", "Status", orderdetail.OrderNumber);
            ViewData["ProductCode"] = new SelectList(_context.Products, "ProductCode", "ProductCode", orderdetail.ProductCode);
            return View(orderdetail);
        }

        // POST: Orderdetails/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("OrderNumber,ProductCode,QuantityOrdered,PriceEach,OrderLineNumber")] Orderdetail orderdetail)
        {
            if (id != orderdetail.OrderNumber)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(orderdetail);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!OrderdetailExists(orderdetail.OrderNumber))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["OrderNumber"] = new SelectList(_context.Orders, "OrderNumber", "Status", orderdetail.OrderNumber);
            ViewData["ProductCode"] = new SelectList(_context.Products, "ProductCode", "ProductCode", orderdetail.ProductCode);
            return View(orderdetail);
        }

        // GET: Orderdetails/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var orderdetail = await _context.Orderdetails
                .Include(o => o.OrderNumberNavigation)
                .Include(o => o.ProductCodeNavigation)
                .FirstOrDefaultAsync(m => m.OrderNumber == id);
            if (orderdetail == null)
            {
                return NotFound();
            }

            return View(orderdetail);
        }

        // POST: Orderdetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var orderdetail = await _context.Orderdetails.FindAsync(id);
            _context.Orderdetails.Remove(orderdetail);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool OrderdetailExists(int id)
        {
            return _context.Orderdetails.Any(e => e.OrderNumber == id);
        }
    }
}
